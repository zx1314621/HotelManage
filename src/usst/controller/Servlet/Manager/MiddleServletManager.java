package usst.controller.Servlet.Manager;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class MiddleServletManager
 */
@WebServlet("/MiddleServletManager")
public class MiddleServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MiddleServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String check = request.getParameter("check");
		if(check!=null&&check.length()>0)
		{
			session.setAttribute("check", check);
			response.sendRedirect("ShowMessageDetailManager.jsp");
		}
		else
		{System.out.print("没有获取到评价编号");}
	}

}
