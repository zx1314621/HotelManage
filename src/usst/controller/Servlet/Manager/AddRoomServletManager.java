package usst.controller.Servlet.Manager;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
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
import java.util.ArrayList;
import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

/**
 * Servlet implementation class AddRoomServletManager
 */
@WebServlet("/AddRoomServletManager")
public class AddRoomServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddRoomServletManager() {
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
        String add = "1";
        ServletContext context = this.getServletContext();
        DataSource dataSource = (DataSource) context.getAttribute("dataSource");
        String room_id = request.getParameter("room_id");
        String roomtype = request.getParameter("roomtype");
        int orientation = Integer.valueOf(request.getParameter("orientation"));
        int floor = Integer.valueOf(request.getParameter("floor"));
        int price = Integer.valueOf(request.getParameter("price"));
        String orient = null;
        if(orientation==1) {orient="东";}
        if(orientation==2) {orient="南";}
        if(orientation==3) {orient="西";}
        if(orientation==4) {orient="北";}
        Room room = new Room();
        room.setRoom_id(room_id);
        room.setRoomtype(roomtype);
        room.setOrientation(orient);
        room.setFloor(floor);
        room.setPrice(price);
        room.setOrderNum(0);
        RoomDao rd = new RoomDao(dataSource);
        rd.addRoom(room);
        ArrayList<Room> RoomList = (ArrayList<Room>) context.getAttribute("RoomList");
        RoomList.add(room);
        context.setAttribute("RoomList", RoomList);
        session.setAttribute("add", add);
        response.sendRedirect("ManagerShowRoom.jsp");
	}

}
