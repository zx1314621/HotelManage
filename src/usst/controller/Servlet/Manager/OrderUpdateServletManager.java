package usst.controller.Servlet.Manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import usst.Dao.OrderDao;
import usst.model.Order;

/**
 * Servlet implementation class OrderUpdateServletManager
 */
@WebServlet("/OrderUpdateServletManager")
public class OrderUpdateServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderUpdateServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 ServletContext context = this.getServletContext();
		 HttpSession session = request.getSession();
		 DataSource dataSource = (DataSource) context.getAttribute("dataSource");
		 ArrayList<Order> OrderList = (ArrayList<Order>) context.getAttribute("OrderList");
		 OrderDao od = new OrderDao(dataSource);
         String order_id =request.getParameter("order_id");
         String name =request.getParameter("name");
         String idcard =request.getParameter("idcard");
         int checkin =Integer.valueOf(request.getParameter("checkin"));
         int checkout =Integer.valueOf(request.getParameter("checkout"));
         String room_id =request.getParameter("room_id");
         int processed =Integer.valueOf(request.getParameter("processed"));
         String requirement =request.getParameter("requirement");
         String roomtype =request.getParameter("roomtype");
         Order order = new Order();
         order.setOrder_id(order_id);
         order.setCustomerName(name);
         order.setIdcard(idcard);
         order.setCheckin(checkin);
         order.setCheckout(checkout);
         order.setRoom_id(room_id);
         order.setProcessed(processed);
         order.setRequirement(requirement);
         order.setRoomtype(roomtype);
         od.update_Order(order);
         for(int i =0;i<OrderList.size();i++)
         {
        	 if(OrderList.get(i).getOrder_id().equals(order.getOrder_id()))
        	 {
        		 OrderList.remove(i);
        	 }
         }
         OrderList.add(order);
         context.setAttribute("OrderList", OrderList);
         String updatesuccessflag = "1";
         session.setAttribute("updatesuccessflag", updatesuccessflag);
         response.sendRedirect("ManagerShowOrder.jsp");
	}

}
