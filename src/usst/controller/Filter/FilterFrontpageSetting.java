package usst.controller.Filter;


import usst.Dao.CustomerDao;
import usst.Dao.OrderDao;
import usst.Dao.RoomDao;
import usst.Service.Receptionist.ReceptionistActions;
import usst.model.Customer;
import usst.model.Order;
import usst.model.Room;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.security.AlgorithmConstraints;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * Servlet Filter implementation class FilterFrontpageSetting
 */
@WebFilter(filterName = "FilterFrontpageSetting",urlPatterns = "/*")
public class FilterFrontpageSetting implements Filter {
    private FilterConfig config;
    public void destroy() {
    }

    public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws ServletException, IOException {
        HttpServletRequest request=(HttpServletRequest)req;
        String requestPath=request.getServletPath();
        ServletContext servletContext=config.getServletContext();
        if (requestPath.endsWith("frontpage.jsp")) {
            OrderDao orderDao=new OrderDao((DataSource)servletContext.getAttribute("dataSource"));
            ArrayList<Order> allorder=orderDao.getAllOrder();
            CustomerDao customerDao=new CustomerDao((DataSource)servletContext.getAttribute("dataSource"));
            ArrayList<Customer> customerlist=customerDao.getAllCustomer();
            servletContext.setAttribute("customerNum",customerlist.size());
            servletContext.setAttribute("allorderNum",allorder.size());
            ArrayList<Order> unhandledorder=orderDao.getOrderbybStatus(0);
            servletContext.setAttribute("unhandledNum",unhandledorder.size());
            ArrayList<Order> customerin=orderDao.getOrderbybStatus(1);
           servletContext.setAttribute("customerinNum",customerin.size());
            RoomDao roomDao=new RoomDao((DataSource)servletContext.getAttribute("dataSource"));
            ArrayList<Room> allroom=roomDao.getAllRoom();
           servletContext.setAttribute("roomNum",allroom.size());
            ReceptionistActions receptionistActions=new ReceptionistActions((DataSource)servletContext.getAttribute("dataSource"));
            Date now = new Date();
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyyMMdd");//可以方便地修改日期格式
            String today = dateFormat.format( now );//获取今天时间
            Calendar calendar = new GregorianCalendar();
            calendar.setTime(now);
            calendar.add(calendar.DATE,1);//把日期往后增加一天.整数往后推,负数往前移动
            now=calendar.getTime(); //这个时间就是日期往后推一天的结果
            SimpleDateFormat formatter = new SimpleDateFormat("yyyyMMdd");
            String tommorow= formatter.format(now);//获取明天时间
            int checkin=Integer.parseInt(today);
            int checkout=Integer.parseInt(tommorow);
            Order order_big=new Order();
            order_big.setCheckin(checkin);
            order_big.setCheckout(checkout);
            order_big.setRoomtype("大床房");
            Order order_std=new Order();
            order_std.setCheckin(checkin);
            order_std.setCheckout(checkout);
            order_std.setRoomtype("标准间");
            Order order_sgl=new Order();
            order_sgl.setCheckin(checkin);
            order_sgl.setCheckout(checkout);
            order_sgl.setRoomtype("单人间");
            ArrayList<String> unfit_room_big=receptionistActions.getUnfitroom(order_big);
            ArrayList<Room> fit_room_big=receptionistActions.getFitroom(unfit_room_big,"大床房");
            ArrayList<String> unfit_room_std=receptionistActions.getUnfitroom(order_std);
            ArrayList<Room> fit_room_std=receptionistActions.getFitroom(unfit_room_std,"标准间");
            ArrayList<String> unfit_room_sgl=receptionistActions.getUnfitroom(order_sgl);
            ArrayList<Room> fit_room_sgl=receptionistActions.getFitroom(unfit_room_big,"单人间");
            servletContext.setAttribute("big_roomNum",fit_room_big.size()+1);
            servletContext.setAttribute("std_roomNum",fit_room_std.size()+1);
            servletContext.setAttribute("sgl_roomNum",fit_room_sgl.size()+1);
        }
            chain.doFilter(req, resp);
    }

    public void init(FilterConfig config) throws ServletException {
        this.config=config;
    }

}