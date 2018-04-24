package usst.controller.Listener;

import javax.servlet.ServletContext;
import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;
import javax.servlet.http.HttpSessionAttributeListener;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import javax.servlet.http.HttpSessionBindingEvent;
import java.text.Format;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;


/**
 * Application Lifecycle Listener implementation class DateListener
 *
 */
@WebListener
public class DateListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public DateListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    private ServletContext context = null;
    public void contextInitialized(ServletContextEvent sce)  { 
         // TODO Auto-generated method stub
    	 Format f = new SimpleDateFormat("yyyy/MM/dd");
         Date today = new Date();
         Calendar c = Calendar.getInstance();
         c.setTime(today);
         c.add(Calendar.DAY_OF_MONTH, 1);
         Date tomorrow = c.getTime();
         String datetime=f.format(today);
         String datetime1=f.format(tomorrow);
         context = sce.getServletContext();
         context.setAttribute("datetime", datetime);
         context.setAttribute("datetime1", datetime1);
    }
	
}
