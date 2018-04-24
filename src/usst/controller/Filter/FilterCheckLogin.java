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
 * Servlet Filter implementation class FilterCheckLogin
 */
@WebFilter("/FilterCheckLogin")
public class FilterCheckLogin implements Filter {

    /**
     * Default constructor. 
     */
    public FilterCheckLogin() {
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
        System.out.println("way_of_login"+way_of_login);
        if (way_of_login==null&&!requestPath.endsWith("login.jsp")&&!requestPath.endsWith("login.do")) {
            RequestDispatcher rd=request.getRequestDispatcher("login.jsp");
            rd.forward(request,resp);
        }
        else {
            chain.doFilter(req, resp);
        }
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
