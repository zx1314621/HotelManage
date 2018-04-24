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
 * Servlet implementation class HandleOrderManager
 */
@WebServlet("/HandleOrderManager")
public class HandleOrderManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleOrderManager() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext context = this.getServletContext();
		DataSource dataSource = (DataSource)context.getAttribute("dataSource");
		ArrayList<Order> OrderList = (ArrayList<Order>) context.getAttribute("OrderList");
		HttpSession session = request.getSession();
		OrderDao od = new OrderDao(dataSource);
		String update = request.getParameter("update");
		String delete = request.getParameter("delete");
		String deleteflag = "1";
		String updateflag = "1";
		if(delete!=null&&delete.length()>0)
		{
			od.deleteOrder(delete);
			session.setAttribute("deleteflag", deleteflag);
			for(int i=0;i<OrderList.size();i++)
			{
				if(OrderList.get(i).getOrder_id().equals(delete))
				{
					OrderList.remove(i);
				}
			}		
		}
		if(update!=null&&update.length()>0)
		{
			int type = 0;
			session.setAttribute("updateflag", updateflag);
			Order order = new Order();
			order = od.getOrder(update);
			if(order.getRoomtype().equals("大床房"))
			{
				type = 0;
			}
			else if(order.getRoomtype().equals("标准间"))
			{
				type = 1;
			}
			else if(order.getRoomtype().equals("单人间"))
			{
				type = 2;
			}
			session.setAttribute("type", type);
			session.setAttribute("updateorder", order);
		}
		response.sendRedirect("ManagerShowOrder.jsp");
	}

}
