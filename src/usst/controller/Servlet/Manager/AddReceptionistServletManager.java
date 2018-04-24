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

import usst.Dao.ReceptionistDao;
import usst.model.Receptionist;

/**
 * Servlet implementation class AddReceptionistServlet
 */
@WebServlet("/AddReceptionistServletManager")
public class AddReceptionistServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddReceptionistServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		ServletContext context = request.getServletContext();
		String receptionist_id = request.getParameter("receptionist_id");
		String password = request.getParameter("password");
		String idcard = request.getParameter("idcard");
		String name = request.getParameter("name");
		String gender = request.getParameter("sex");
		int age = Integer.valueOf(request.getParameter("age"));
		Receptionist receptionist = new Receptionist();
		ReceptionistDao rd = new ReceptionistDao((DataSource)context.getAttribute("dataSource"));
		receptionist.setReceptionist_id(receptionist_id);
		receptionist.setPassword(password);
		receptionist.setIdcard(idcard);
		receptionist.setName(name);
		receptionist.setGender(gender);
		receptionist.setAge(age);
		rd.addReceptionist(receptionist);
		ArrayList<Receptionist> ReceptionistList=(ArrayList<Receptionist>) context.getAttribute("ReceptionistList");
		ReceptionistList.add(receptionist);
		context.setAttribute("ReceptionistList", ReceptionistList);
		String flag = "1";
		HttpSession session = request.getSession();
		session.setAttribute("recepflag", flag);
		response.sendRedirect("ManagerShowRece.jsp");
	}

}
