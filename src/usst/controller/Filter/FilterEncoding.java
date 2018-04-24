package usst.controller.Filter;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import java.io.IOException;

/**
 * Servlet Filter implementation class FilterEncoding
 */
@WebFilter(filterName = "FilterEncoding",urlPatterns = "/*")
public class FilterEncoding implements Filter {
	private FilterConfig config;
    /**
     * Default constructor. 
     */
    public FilterEncoding() {
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
		 req.setCharacterEncoding("utf-8");
	        resp.setContentType("text/html;charset=utf-8");
	        resp.setCharacterEncoding("utf-8");
	        chain.doFilter(req, resp);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig config) throws ServletException {
		// TODO Auto-generated method stub
		 this.config=config;
    }

}
