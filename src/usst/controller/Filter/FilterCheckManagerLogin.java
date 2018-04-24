package usst.controller.Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class FilterCheckManagerLogin
 */
@WebFilter(filterName = "FilterCheckManagerLogin",urlPatterns={
        "/ManagerAddRoom.jsp",
        "/ManagerDeleteRoom.jsp",
        "/ManagerShowOrder.jsp",
        "/ManagerShowRoom.jsp",
        "/ManagerShowRece.jsp",
        "/ManagerUpdateRece.jsp",
        "/ManagerUpdateRoom.jsp",
        "/UpdateOrderManager.jsp",
        "/Update_success.jsp",
        "/ShowCustomerManager.jsp",
        "/ShowMessageDetailManager.jsp",
        "/MReceptionistAddRoom.jsp",
        "/ChartMonthManager.jsp",
        "/CheckCustomerManager.jsp"
})
public class FilterCheckManagerLogin implements Filter {

    /**
     * Default constructor. 
     */
    public FilterCheckManagerLogin() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request=(HttpServletRequest)req;
        HttpSession session=request.getSession();
        String requestPath=request.getServletPath();
        String way_of_login=(String) session.getAttribute("way_of_login");
        if (way_of_login!=null&&way_of_login.length()>0&&way_of_login.equals("M")){
            chain.doFilter(req, resp);
        }
        else {
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.forward(request,resp);
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
