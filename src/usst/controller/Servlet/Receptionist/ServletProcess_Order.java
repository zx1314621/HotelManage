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

@WebServlet(name = "ServletProcess_Order",urlPatterns = "/process_order.do")
public class ServletProcess_Order extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       ServletContext context=request.getServletContext();
        OrderDao orderDao=new OrderDao((DataSource)context.getAttribute("dataSource"));
        RoomDao roomDao=new RoomDao((DataSource)context.getAttribute("dataSource"));
        ReceptionistActions receptionistActions=new ReceptionistActions((DataSource)context.getAttribute("dataSource"));
        String chakan = request.getParameter("chakan");
        String xuzhu=request.getParameter("xuzhu");
        //region  判断是否为查看命令
        if (chakan != null && chakan.length() > 0) {
            Order order = orderDao.getOrder(chakan);
            Room room = roomDao.getRoom(order.getRoom_id());
            int duration = (int) receptionistActions.TimeDifference(order.getCheckin(), order.getCheckout());
            System.out.println("duration"+duration);
            HttpSession session = request.getSession();
            session.setAttribute("chakan_bill_order", order);
            session.setAttribute("chakan_bill_room", room);
            session.setAttribute("chakan_bill_duration", duration);
            session.setAttribute("chakan_bill_flag", "1");
            response.sendRedirect("checkin_SearchOrder.jsp");
        }
        //endregion
        //region 判断是否为续住命令
        else if(xuzhu!=null&&xuzhu.length()>0){
            //String order_id=xuzhu;
            Order order=orderDao.getOrder(xuzhu);
            RequestDispatcher rd=request.getRequestDispatcher("checkout_prolong.jsp");
            request.setAttribute("xuzhu_order",order);
            rd.forward(request,response);
        }
        //endregion
        //region 判断是否为分房命令
        else {
            String order_id = request.getParameter("order_id");
            Order order = orderDao.getOrder(order_id);
            HttpSession session = request.getSession();
            session.setAttribute("order_id", order.getOrder_id());
            Room room = roomDao.getRoom(order.getRoom_id());
            ArrayList<String> unfit_room = receptionistActions.getUnfitroom(order);
            System.out.println(order.getRoomtype());
            ArrayList<Room> fit_room = receptionistActions.getFitroom(unfit_room, order.getRoomtype());
            //把预先分配的 也加进来选择
            fit_room.add(room);
            RequestDispatcher rd = request.getRequestDispatcher("checkin_AssignRoom.jsp");
            request.setAttribute("fitroom", fit_room);
            rd.forward(request, response);
        }
        //endregion
    }

}
