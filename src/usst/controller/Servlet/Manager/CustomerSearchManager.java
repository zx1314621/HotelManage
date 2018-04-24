package usst.controller.Servlet.Manager;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import usst.Dao.CustomerDao;
import usst.Dao.OrderDao;
import usst.model.Customer;
import usst.model.Order;

/**
 * Servlet implementation class CustomerSearchManager
 */
@WebServlet("/CustomerSearchManager")
public class CustomerSearchManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerSearchManager() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.print("123");
		String name = request.getParameter("name");
		String living =request.getParameter("living");
		String whole =request.getParameter("whole");
		String customer_id =request.getParameter("customer_id");
		ServletContext context =this.getServletContext();
		CustomerDao cd =new CustomerDao((DataSource)context.getAttribute("dataSource"));
		OrderDao od =new OrderDao((DataSource)context.getAttribute("dataSource"));
		ArrayList<Customer> CustomerList = new ArrayList<Customer>();
		ArrayList<Order> OrderList = new ArrayList<Order>();
		HttpSession session = request.getSession();
		OrderList = od.getAllOrder();
		//
		int change = 0;
		if(living!=null&&living.equals("1"))
		{
			
			CustomerList=cd.getAllCustomer();
			
				for(int i=0;i<CustomerList.size();i++)
				{
					int fl = 0;
					for(int j = 0; j <OrderList.size();j++)
					{
						if(CustomerList.get(i).getName().equals(OrderList.get(j).getCustomerName())&&OrderList.get(j).getProcessed()==1)
								{				             
						            fl=1; 						
								}	
					}
					if(fl==0)
					{CustomerList.remove(i);
					i--;}			
				}
			change = 1;
		}
		else if(whole!=null&&whole.equals("2"))
		{
			change = 0;
			CustomerList=cd.getAllCustomer();
		}
		else{
		if(customer_id!=null&&customer_id.length()>0)
		{
			Customer customer= new Customer();
			customer=cd.getCustomer(customer_id);
			if(customer.getCustomer_id()!=null)
			{CustomerList.add(customer);}
		}
		else if(name!=null&&name.length()>0)
		{
			CustomerList=cd.getCustomerbyName(name);
		}
		else
		{
			CustomerList=cd.getAllCustomer();
		}
		}
		request.setAttribute("CustomerList", CustomerList);
		session.setAttribute("change", change);
		RequestDispatcher rd1 = request.getRequestDispatcher("/ShowCustomerManager.jsp");
		rd1.forward(request, response);
	}

}
