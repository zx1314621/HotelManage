package usst.controller.Servlet.Receptionist;

import usst.Dao.OrderDao;
import usst.Dao.RoomDao;
import usst.model.Room;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;

@WebServlet(name = "ServletAssign_Room",urlPatterns = "/assignroom.do")
public class ServletAssign_Room extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        ServletContext context=request.getServletContext();
        HttpSession session=request.getSession();
        String order_id=(String) session.getAttribute("order_id");
        String room_id=request.getParameter("room_id");
        OrderDao orderDao=new OrderDao((DataSource)context.getAttribute("dataSource"));
        RoomDao roomDao=new RoomDao((DataSource)context.getAttribute("dataSource"));
        //分配房间以后，更新订单的room_id, room属性的orderNum加一
        Room room=roomDao.getRoom(room_id);
        int neworderNum=room.getOrderNum();
        neworderNum=neworderNum+1;
        room.setOrderNum(neworderNum);
        if(orderDao.update_Room_id(order_id,room_id)&&roomDao.updateRoom(room)){
            //更新房间状态
            orderDao.update_Status(order_id,1);
            session.setAttribute("assignroom_flag","1");
            System.out.println("置1");
            response.sendRedirect("checkin_AssignRoom.jsp");
        }
        else {
            System.out.println("置0");
            session.setAttribute("assignroom_flag","0");
            response.sendRedirect("checkin_AssignRoom.jsp");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
