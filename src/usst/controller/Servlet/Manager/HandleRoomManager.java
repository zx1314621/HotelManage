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
 * Servlet implementation class HandleRoomManager
 */
@WebServlet("/HandleRoomManager")
public class HandleRoomManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleRoomManager() {
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
		String keep = request.getParameter("keep");
		String recover = request.getParameter("recover");
		HttpSession session = request.getSession();
		String flag = "1";
		String flag1 = "1";
		if(delete!=null&&delete.length()>0)
		{
			RoomDao rd = new RoomDao((DataSource)context.getAttribute("dataSource"));
			rd.deleteRoom(delete);
			session.setAttribute("flag", flag);
			ArrayList<Room> RoomList = (ArrayList<Room>) context.getAttribute("RoomList");
			for(int i =0;i<RoomList.size();i++)
			{
				if(RoomList.get(i).getRoom_id().equals(delete))
				{
					RoomList.remove(i);
				}
			}
			context.setAttribute("RoomList", RoomList);
			response.sendRedirect("ManagerShowRoom.jsp");
		}
		else if(update!=null&&update.length()>0)
		{
			RoomDao rd = new RoomDao((DataSource)context.getAttribute("dataSource"));
			Room room = new Room();
			room=rd.getRoom(update);
			String orientation = null;
			if(room.getOrientation().equals("东")) {orientation="1";}
			if(room.getOrientation().equals("南")) {orientation="2";}
			if(room.getOrientation().equals("西")) {orientation="3";}
			if(room.getOrientation().equals("北")) {orientation="4";}
			String floor = null;
			if(room.getFloor()==1) {floor="1";}
			if(room.getFloor()==2) {floor="2";}
			if(room.getFloor()==3) {floor="3";}
			String roomtype = null;
			if(room.getRoomtype().equals("大床房")) {roomtype="1";}
			if(room.getRoomtype().equals("标准间")) {roomtype="2";}
			if(room.getRoomtype().equals("单人间")) {roomtype="3";}
			session.setAttribute("orientation", orientation);
			session.setAttribute("floor", floor);
			session.setAttribute("roomtype", roomtype);
			session.setAttribute("updateroom", room);
			session.setAttribute("flag1", flag1);
			response.sendRedirect("ManagerShowRoom.jsp");
		}
		else if(keep!=null&&keep.length()>0)
		{
			RoomDao rd = new RoomDao((DataSource)context.getAttribute("dataSource"));
			String keepflag = "0";
			if(rd.getRoom(keep).getEngaged()!=1)	
			{
				keepflag = "1";
				rd.changeRoomEngaged(keep, 2);
				ArrayList<Room> RoomList = (ArrayList<Room>) context.getAttribute("RoomList");
				for(int i = 0;i<RoomList.size();i++)
				{
					if(keep.equals(RoomList.get(i).getRoom_id()))
					{
						RoomList.get(i).setEngaged(2);
					}
				}
				context.setAttribute("RoomList", RoomList);
			}else {keepflag = "0";}		
			session.setAttribute("keepflag", keepflag);
			response.sendRedirect("ManagerShowRoom.jsp");
		}
		else if(recover!=null&&recover.length()>0)
		{
			String recoverflag = "1";
			RoomDao rd = new RoomDao((DataSource)context.getAttribute("dataSource"));
			rd.changeRoomEngaged(recover, 0);
			ArrayList<Room> RoomList = (ArrayList<Room>) context.getAttribute("RoomList");
			for(int i = 0;i<RoomList.size();i++)
			{
				if(recover.equals(RoomList.get(i).getRoom_id()))
				{
					RoomList.get(i).setEngaged(0);
				}
			}
			context.setAttribute("RoomList", RoomList);
			session.setAttribute("recoverflag", recoverflag);
			response.sendRedirect("ManagerShowRoom.jsp");
		}
	}

}
