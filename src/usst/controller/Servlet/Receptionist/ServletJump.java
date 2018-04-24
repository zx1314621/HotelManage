package usst.controller.Servlet.Receptionist;

import usst.Dao.OrderDao;
import usst.Dao.RoomDao;
import usst.Service.Receptionist.ReceptionistActions;
import usst.model.Order;
import usst.model.Receptionist;
import usst.model.Room;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;

@WebServlet(name = "ServletJump",urlPatterns = "/jump.do")
public class ServletJump extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action=request.getParameter("action");
        if (action.equals("idcard_order")){
            ServletContext context=request.getServletContext();
            OrderDao orderDao=new OrderDao((DataSource)context.getAttribute("dataSource"));
            String idcard=request.getParameter("idcard");
            ArrayList<Order> orderlist=orderDao.getOrdersBy_idcard(idcard);
            RequestDispatcher rd=request.getRequestDispatcher("checkin_SearchOrderResult.jsp");
            request.setAttribute("order",orderlist);
            rd.forward(request,response);
        }
        if (action.equals("search")) {
            String checkin_s=request.getParameter("checkin");
            String checkout_s=request.getParameter("checkout");
            String roomtype=request.getParameter("roomtype");
            int checkin=0,checkout=0;
            try {
                checkin=Integer.parseInt(checkin_s);
                checkout=Integer.parseInt(checkout_s);
            }catch (NumberFormatException e){
                //日期不能转为Int型
                response.sendRedirect("receptionist_homepage");
            }
            Order order=new Order();
            order.setCheckin(checkin);
            order.setCheckout(checkout);
            order.setRoomtype(roomtype);
            ServletContext context=request.getServletContext();
            ReceptionistActions receptionistActions=new ReceptionistActions((DataSource)context.getAttribute("dataSource"));


            ArrayList<String> unfit_room=receptionistActions.getUnfitroom(order);
            ArrayList<Room> fit_room=receptionistActions.getFitroom(unfit_room,roomtype);
            RequestDispatcher rd=request.getRequestDispatcher("checkin_AssignRoom.jsp");
            request.setAttribute("fitroom",fit_room);
            rd.forward(request,response);
        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
