package usst.controller.Servlet.Manager;

import usst.Dao.OrderDao;
import usst.model.Order;

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

/**
 * Servlet implementation class OrderSearchServletManager
 */
@WebServlet("/OrderSearchServletManager")
public class OrderSearchServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OrderSearchServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = this.getServletContext();
		String order_id = request.getParameter("order_id");
		String name = request.getParameter("customer_name");
		String roomtype = request.getParameter("roomtype");
		OrderDao od = new OrderDao((DataSource)context.getAttribute("dataSource"));
        ArrayList<Order> OrderList = new ArrayList<Order> ();;
        if(order_id!=null&&(order_id.equals("0")==false))
        {
        	Order order = new Order();
        	order=od.getOrder(order_id);
        	if(order!=null&&order.getOrder_id()!=null)
        	{OrderList.add(order);}
        }
        else
        {
        	OrderList =od.getAllOrder();      	
        }
        if(name!=null&&(name.equals("0")==false))
        {
        	for(int i=0;i<OrderList.size();i++)
        	{
        		if(OrderList.get(i).getCustomerName().equals(name))
        		{
        			continue;
        		}else
        		{
        			OrderList.remove(i);
        			i--;
        		}
        	}
        	
        }
        if(roomtype!=null&&(roomtype.equals("0")==false))
        {
        	for(int i=0;i<OrderList.size();i++)
        	{
        		if(OrderList.get(i).getRoomtype().equals(roomtype))
        		{
        			continue;
        		}else {
        			OrderList.remove(i);
        			i--;
        		}
        	}
        }
        request.setAttribute("OrderList", OrderList);
        RequestDispatcher rd1 = request.getRequestDispatcher("/ManagerShowOrder.jsp");
        rd1.forward(request, response);
	}

}
