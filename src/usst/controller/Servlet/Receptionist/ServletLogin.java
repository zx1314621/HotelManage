package usst.controller.Servlet.Receptionist;

import usst.Dao.ManagerDao;
import usst.Dao.ReceptionistDao;
import usst.model.Manager;
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

@WebServlet(name = "ServletLogin",urlPatterns = "/login.do")
public class ServletLogin extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context=request.getServletContext();
        HttpSession session=request.getSession();
        String way=request.getParameter("way");
        String username=request.getParameter("username");
        String password=request.getParameter("password");
        //验证经理
        if (way.equals("M")){
            ManagerDao managerDao=new ManagerDao((DataSource) context.getAttribute("dataSource"));
            Manager manager=managerDao.getManager(username);
            if (manager!=null&&manager.getPassword().equals(password)){
                session.setAttribute("way_of_login","M");
                session.setAttribute("login_manager_id",username);
                session.setAttribute("login_receptionist_id",null);
                response.sendRedirect("newhomepage.jsp");
            }
            else {
                session.setAttribute("login_fail","fail");
                response.sendRedirect("login.jsp");
            }
        }
        //验证前台
        else {
            ReceptionistDao receptionistDao=new ReceptionistDao((DataSource) context.getAttribute("dataSource"));
            Receptionist receptionist=receptionistDao.getReceptionist(username);
            if (receptionist!=null&&receptionist.getPassword().equals(password)){
                session.setAttribute("way_of_login","R");
                session.setAttribute("login_receptionist_id",username);
                session.setAttribute("login_manager_id",null);
                response.sendRedirect("newhomepage.jsp");
            }
            else {
                session.setAttribute("login_fail","fail");
                response.sendRedirect("login.jsp");
            }
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
