package usst.controller.Servlet.Manager;

import usst.Dao.ReceptionistDao;
import usst.model.Receptionist;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class UpdateReceptionistServletManager
 */
@WebServlet("/UpdateReceptionistServletManager")
public class UpdateReceptionistServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateReceptionistServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        HttpSession session = request.getSession();
        String receptionist_id = request.getParameter("receptionist_id");
        String password = request.getParameter("password");
        String name = request.getParameter("name");
        String gender = request.getParameter("sex");
        String idcard = request.getParameter("idcard");
        int age = Integer.valueOf(request.getParameter("age"));
        Receptionist receptionist = new Receptionist();
        receptionist.setReceptionist_id(receptionist_id);
        receptionist.setPassword(password);
        receptionist.setName(name);
        receptionist.setGender(gender);
        receptionist.setIdcard(idcard);
        receptionist.setAge(age);
        ServletContext context = this.getServletContext();
        DataSource dataSource=(DataSource) context.getAttribute("dataSource");
        ReceptionistDao rpd = new ReceptionistDao(dataSource);
        rpd.update(receptionist);
        ArrayList<Receptionist> ReceptionistList = new ArrayList<Receptionist>();
        ReceptionistList = (ArrayList<Receptionist>) context.getAttribute("ReceptionistList");
        for(int i = 0;i<ReceptionistList.size();i++)
        {
            if(ReceptionistList.get(i).getReceptionist_id().equals(receptionist_id))
            {
                ReceptionistList.remove(i);
            }
        }
        ReceptionistList.add(receptionist);
        String updateflag = "1";
        session.setAttribute("updateflag", updateflag);
        context.setAttribute("ReceptionistList", ReceptionistList);
        response.sendRedirect("ManagerShowRece.jsp");
	}

}
