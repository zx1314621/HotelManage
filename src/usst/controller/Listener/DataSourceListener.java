package usst.controller.Listener;

import java.text.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.servlet.ServletContext;
import javax.servlet.ServletContextAttributeEvent;
import javax.servlet.ServletContextAttributeListener;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.sql.DataSource;

import usst.Dao.*;
import usst.model.*;

/**
 * Application Lifecycle Listener implementation class DataSourceListener
 *
 */
@WebListener
public class DataSourceListener implements ServletContextListener, ServletContextAttributeListener {

    /**
     * Default constructor. 
     */
    public DataSourceListener() {
        // TODO Auto-generated constructor stub
    }
	/**
     * @see ServletContextAttributeListener#attributeAdded(ServletContextAttributeEvent)
     */
    public void attributeAdded(ServletContextAttributeEvent scae)  { 
         // TODO Auto-generated method stub
    	context = scae.getServletContext();
    	context.log("添加了一个属性："+new Date());
    }

	/**
     * @see ServletContextAttributeListener#attributeRemoved(ServletContextAttributeEvent)
     */
    public void attributeRemoved(ServletContextAttributeEvent scae)  { 
         // TODO Auto-generated method stub
    	context = scae.getServletContext();
    	context.log("删除了一个属性："+new Date());
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	context = sce.getServletContext();
    	context.removeAttribute("dataSource");
    	context.log("应用程序已关闭："+new Date());
    }
	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    private ServletContext context = null;
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	Context ctx = null;
    	DataSource dataSource = null;
    	context = sce.getServletContext();
    	try {
    		if(ctx == null)
			{
    			ctx = new InitialContext();
    		}
    		dataSource =
    				(DataSource)ctx.lookup("java:comp/env/jdbc/sampleDS");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			context.log("Exception"+e);
		}
    	ArrayList<Room> RoomList = new ArrayList<Room>();
    	ArrayList<Order> OrderList = new ArrayList<Order>();
    	ArrayList<Receptionist> ReceptionistList = new ArrayList<Receptionist>();
    	ArrayList<Customer> CustomerList = new ArrayList<Customer>();
    	RoomDao rd = new RoomDao(dataSource);
    	OrderDao od = new OrderDao(dataSource);
    	CustomerDao cd = new CustomerDao(dataSource);
    	ReceptionistDao rld = new ReceptionistDao(dataSource);
    	OrderList = od.getAllOrder();
    	RoomList = rd.lxygetAllRoom();
    	ReceptionistList = rld.getReceptionist();
    	CustomerList = cd.getAllCustomer();
    	Format f = new SimpleDateFormat("yyyyMMdd");								 
    	Date today1 = new Date();		 					 
    	String datetime=f.format(today1);
    	int today = Integer.valueOf(datetime);
    	 for(int i = 0; i<OrderList.size();i++)
	        {
	            for(int j = 0;j<RoomList.size();j++)
	            {
	                String roomId = OrderList.get(i).getRoom_id();
	                String roomd = RoomList.get(j).getRoom_id();
	                if(roomId.equals(roomd))
	                {
	                    if(today<OrderList.get(i).getCheckout()&&today>=OrderList.get(i).getCheckin())
	                    {rd.changeRoomEngaged(roomd, 1);RoomList.get(j).setEngaged(1);}
	                }
	            }
	        }
    	context.setAttribute("CustomerList", CustomerList);
    	context.setAttribute("OrderList", OrderList);
    	context.setAttribute("ReceptionistList", ReceptionistList);
    	context.setAttribute("RoomList", RoomList);
    	context.setAttribute("dataSource", dataSource);
    	context.log("应用程序已启动："+new Date());
    	
    }
	@Override
	public void attributeReplaced(ServletContextAttributeEvent arg0) {
		// TODO Auto-generated method stub
		context = arg0.getServletContext();
    	context.log("更改了一个属性："+new Date());
	}
}
