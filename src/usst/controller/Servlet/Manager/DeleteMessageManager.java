package usst.controller.Servlet.Manager;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import usst.Dao.MessageDao;

/**
 * Servlet implementation class DeleteMessageManager
 */
@WebServlet("/DeleteMessageManager")
public class DeleteMessageManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteMessageManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String customer_id = request.getParameter("customer_id");
		String message = request.getParameter("message");
		ServletContext context = this.getServletContext();	
		DataSource dataSource = (DataSource) context.getAttribute("dataSource");
		MessageDao md = new MessageDao(dataSource);
		md.deleteMessage(customer_id, message);
		response.sendRedirect("deleteMessageSuccessManager.jsp");
	}

}
