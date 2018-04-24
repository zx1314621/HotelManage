package usst.controller.Servlet.Manager;

import usst.Dao.ReceptionistDao;
import usst.model.Receptionist;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;
import java.io.IOException;
import java.util.ArrayList;

/**
 * Servlet implementation class ReceptionistSearchServletManager
 */
@WebServlet("/ReceptionistSearchServletManager")
public class ReceptionistSearchServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ReceptionistSearchServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 ServletContext context = this.getServletContext();
	        DataSource dataSource = (DataSource) context.getAttribute("dataSource");
	        String receptionist_id =request.getParameter("receptionist_id");
	        ArrayList<Receptionist> ReceptionistList = new ArrayList<Receptionist>();
	        ReceptionistDao rld = new ReceptionistDao(dataSource);
	        if(receptionist_id!=null&&receptionist_id.length()>0)
	        {
	            Receptionist rt =new  Receptionist();
	            rt = rld.getReceptionist(receptionist_id);
	            if(rt.getReceptionist_id()!=null)
	            {ReceptionistList.add(rt);}
	        }
	        else
	        {
	            ReceptionistList = rld.getReceptionist();
	        }
	        request.setAttribute("ReceptionistList", ReceptionistList);
	        RequestDispatcher rd1 = request.getRequestDispatcher("/ManagerShowRece.jsp");
	        rd1.forward(request, response);
	}

}
