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
import usst.model.*;

/**
 * Servlet implementation class HandleReceptionistManager
 */
@WebServlet("/HandleReceptionistManager")
public class HandleReceptionistManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleReceptionistManager() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
        ServletContext context = this.getServletContext();
        String update = request.getParameter("update");
        String delete = request.getParameter("delete");
        HttpSession session = request.getSession();
        DataSource dataSource = (DataSource) context.getAttribute("dataSource");
        String flag = "1";
        String flag1 = "1";
        if(delete!=null&&delete.length()>0)
        {
            session.setAttribute("flag", flag);
            ReceptionistDao rpd =new ReceptionistDao(dataSource);
            rpd.deleteReceptionist(delete);
            ArrayList<Receptionist> ReceptionistList = new ArrayList<Receptionist>();
            ReceptionistList =(ArrayList<Receptionist>) context.getAttribute("ReceptionistList");
            for(int i=0;i<ReceptionistList.size();i++)
            {
                if(ReceptionistList.get(i).getReceptionist_id().equals(delete))
                {
                    ReceptionistList.remove(i);
                }
            }
            context.setAttribute("ReceptionistList", ReceptionistList);
            response.sendRedirect("ManagerShowRece.jsp");

        }
        else if(update!=null&&update.length()>0)
        {
            ReceptionistDao rpd = new ReceptionistDao((DataSource)context.getAttribute("dataSource"));
            Receptionist recept = new Receptionist();
            recept = rpd.getReceptionist(update);
            String sex = "0";
            if(recept.getGender().equals("男")) { sex="1";}
            if(recept.getGender().equals("女")) { sex="2";}
            session.setAttribute("sex", sex);
            session.setAttribute("updateReceptionist", recept);
            session.setAttribute("flag1", flag1);
            response.sendRedirect("ManagerShowRece.jsp");
        }
	}

}
