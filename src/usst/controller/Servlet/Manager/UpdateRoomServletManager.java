package usst.controller.Servlet.Manager;

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

/**
 * Servlet implementation class UpdateRoomServletManager
 */
@WebServlet("/UpdateRoomServletManager")
public class UpdateRoomServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateRoomServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
        ServletContext context = this.getServletContext();
        DataSource dataSource = (DataSource) context.getAttribute("dataSource");
        ArrayList<Room> RoomList = (ArrayList<Room>) context.getAttribute("RoomList");
        String room_id = request.getParameter("room_id");
        String roomtype = request.getParameter("roomtype");
        String orientation = null;
        int orient = Integer.valueOf(request.getParameter("orientation"));
        int floor = Integer.valueOf(request.getParameter("floor"));
        int price = Integer.valueOf(request.getParameter("price"));
        HttpSession session = request.getSession();
        Room flag =new Room();
        flag = (Room)session.getAttribute("updateroom");
        Room room = new Room();
        if(orient==1) {orientation="东";}
        if(orient==2) {orientation="南";}
        if(orient==3) {orientation="西";}
        if(orient==4) {orientation="北";}
        room.setRoom_id(room_id);
        room.setRoomtype(roomtype);
        room.setOrientation(orientation);
        room.setFloor(floor);
        room.setPrice(price);
        room.setOrderNum(flag.getOrderNum());
        RoomDao rd = new RoomDao(dataSource);
        rd.updateRoom(room);
        //更新
        for(int i=0;i<RoomList.size();i++)
        {
            if(RoomList.get(i).getRoom_id().equals(room_id))
            {
                RoomList.remove(i);
            }
        }
        RoomList.add(room);
        String updateflag = "1";
        session.setAttribute("updateflag", updateflag);
        context.setAttribute("RoomList", RoomList);
        response.sendRedirect("ManagerShowRece.jsp");
	}

}
