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

@WebServlet(name = "ServletSearch_Order",urlPatterns = "/searchorder.do")
public class ServletSearch_Order extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context=request.getServletContext();
        OrderDao orderDao=new OrderDao((DataSource)context.getAttribute("dataSource"));
        RoomDao roomDao=new RoomDao((DataSource)context.getAttribute("dataSource"));
        ReceptionistActions receptionistActions=new ReceptionistActions((DataSource)context.getAttribute("dataSource"));
        String idcard=request.getParameter("idcard");
        HttpSession session=request.getSession();
        ArrayList<Order> orderlist=orderDao.getOrdersBy_idcard(idcard);
        if (orderlist.size()==0){
            session.setAttribute("noorder_message","未检索到订单！请输入正确的身份证号码");
            response.sendRedirect("checkin_SearchOrderResult.jsp");
        }
        else {
            RequestDispatcher rd=request.getRequestDispatcher("checkin_SearchOrderResult.jsp");
            request.setAttribute("order",orderlist);
            rd.forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
