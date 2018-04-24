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

import usst.Dao.CustomerDao;
import usst.Dao.MessageDao;
import usst.model.Customer;
import usst.model.Message;
import usst.model.Room;

/**
 * Servlet implementation class HandleCustomerManager
 */
@WebServlet("/HandleCustomerManager")
public class HandleCustomerManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleCustomerManager() {
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
		CustomerDao cd = new CustomerDao((DataSource)context.getAttribute("dataSource"));
		MessageDao md = new MessageDao((DataSource)context.getAttribute("dataSource")); 
		ArrayList<Message> MessageList = new ArrayList<Message>();
		String check = request.getParameter("check");
		String delete = request.getParameter("delete");
		String flag = "1";
		String flag1 = "2";
		if(delete!=null&&delete.length()>0)
		{
			cd.deleteCustomer(delete);
			session.setAttribute("flag", flag);
			ArrayList<Customer> CustomerList = (ArrayList<Customer>) context.getAttribute("CustomerList");
			for(int i =0;i<CustomerList.size();i++)
			{
				if(CustomerList.get(i).getCustomer_id().equals(delete))
				{
					CustomerList.remove(i);
				}
			}
			context.setAttribute("CustomerList", CustomerList);
			response.sendRedirect("ShowCustomerManager.jsp");
		}
		if(check!=null&&check.length()>0)
		{
			Customer customer = new Customer();
			MessageList = md.getMessageBy_CustomerId(check);
			customer=cd.getCustomer(check);
			session.setAttribute("flag1", flag1);
			session.setAttribute("customer", customer);
			session.setAttribute("MessageList", MessageList);
			response.sendRedirect("ShowCustomerManager.jsp");
		}
	}

}
