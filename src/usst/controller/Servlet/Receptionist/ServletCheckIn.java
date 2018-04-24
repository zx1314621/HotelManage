package usst.controller.Servlet.Receptionist;

import usst.Dao.OrderDao;
import usst.Dao.RoomDao;
import usst.Service.Receptionist.ReceptionistActions;
import usst.model.Order;
import usst.model.Room;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletCheckIn",urlPatterns = "/checkin.do")
public class ServletCheckIn extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context=request.getServletContext();
        OrderDao orderDao=new OrderDao((DataSource)context.getAttribute("dataSource"));
        ReceptionistActions receptionistActions=new ReceptionistActions((DataSource)context.getAttribute("dataSource"));
        String action =request.getParameter("action");
        if (action!=null&&action.length()>1&&action.equals("checkin_temp")){
            String checkin_s=request.getParameter("checkin");
            String checkout_s=request.getParameter("checkout");
            String customerName=request.getParameter("customerName");
            String idcard=request.getParameter("idcard");
            String roomtype=request.getParameter("roomtype");
            int checkin=0,checkout=0;
            try {
                checkin=Integer.parseInt(checkin_s);
                checkout=Integer.parseInt(checkout_s);
            }catch (NumberFormatException e){
                //日期不能转为Int型
                response.sendRedirect("checkin_TempOrder.jsp");
            }
            int order_id=receptionistActions.getOrderNum()+1;
            Order order=new Order();
            order.setIdcard(idcard);
            order.setCustomerName(customerName);
            order.setCheckin(checkin);
            order.setCheckout(checkout);
            order.setRoomtype(roomtype);
            order.setOrder_id(Integer.toString(order_id));
            //检查order 是否可以生成;
            ArrayList<String> unfit_room=receptionistActions.getUnfitroom(order);
            ArrayList<Room> fit_room=receptionistActions.getFitroom(unfit_room,roomtype);
            //若有匹配的房间
            if (fit_room.size()>0){
                order.setRoom_id(fit_room.get(0).getRoom_id());
                //加到订单表
                HttpSession session=request.getSession();
                session.setAttribute("skorder_id",Integer.toString(order_id));
                orderDao.addOrder(order);
                RequestDispatcher rd=request.getRequestDispatcher("checkin_sk_fitroom.jsp");
                request.setAttribute("fitroom",fit_room);
                rd.forward(request,response);
            }
            else {
                HttpSession session=request.getSession();
                session.setAttribute("sk_fail","fail");
                response.sendRedirect("checkin_TempOrder.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
