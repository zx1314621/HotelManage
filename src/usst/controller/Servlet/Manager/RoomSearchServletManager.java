package usst.controller.Servlet.Manager;

import usst.Dao.OrderDao;
import usst.Dao.RoomDao;
import usst.model.Order;
import usst.model.Room;

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
 * Servlet implementation class RoomSearchServletManager
 */
@WebServlet("/RoomSearchServletManager")
public class RoomSearchServletManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RoomSearchServletManager() {
        super();
        // TODO Auto-generated constructor stub
    }


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 ArrayList<Room> RoomList = new ArrayList<Room>();
	        ArrayList<Order> OrderList = new ArrayList<Order>();
	        ServletContext context =this.getServletContext();
	        int type = Integer.valueOf(request.getParameter("roomtyle"));
	        int floor = Integer.valueOf(request.getParameter("floor"));
	        int orientation = Integer.valueOf(request.getParameter("orientation"));
	        String roomtype = null;
	        DataSource dataSource = (DataSource) context.getAttribute("dataSource");
	        RoomDao rd = new RoomDao(dataSource);
	        OrderDao od =new OrderDao(dataSource);
	        //获取今日时间
	        String date1 = (String) context.getAttribute("datetime");
	        String[] sourceStrArray1 = date1.split("/");
	        int today = Integer.valueOf(sourceStrArray1[0]+sourceStrArray1[1]+sourceStrArray1[2]);
	        //房间类型
	        if(type==1)
	        {roomtype = "大床房";}
	        else if(type==2)
	        { roomtype = "标准间";}
	        else if(type==3)
	        { roomtype = "单人间";}
	        if(type==0)
	        {RoomList = rd.lxygetAllRoom();}
	        else
	        {
	            RoomList = rd.lxygetRooms_by_roomtype(roomtype);
	        }
	        //房间楼层
	        if(floor!=0)
	        {
	            for(int i =0;i<RoomList.size();i++)
	            {
	                if(RoomList.get(i).getFloor()!=floor)
	                {
	                    RoomList.remove(i);
	                    i--;
	                }
	            }
	        }
	        //房间朝向

	        if(orientation!=0)
	        {
	            if(orientation==1)
	            {
	                for(int i =0;i<RoomList.size();i++)
	                {
	                    if(RoomList.get(i).getOrientation().equals("东"))
	                    {
	                        continue;
	                    }else {RoomList.remove(i);i--;}
	                }
	            }

	            else if(orientation==2)
	            {
	                for(int i =0;i<RoomList.size();i++)
	                {
	                    if(RoomList.get(i).getOrientation().equals("南"))
	                    {
	                        continue;
	                    }else {RoomList.remove(i);i--;}
	                }
	            }
	            else if(orientation==3)
	            {
	                for(int i =0;i<RoomList.size();i++)
	                {
	                    if(RoomList.get(i).getOrientation().equals("西"))
	                    {
	                        continue;
	                    }else {RoomList.remove(i);i--;}
	                }
	            }
	            else if(orientation==4)
	            {
	                for(int i =0;i<RoomList.size();i++)
	                {
	                    if(RoomList.get(i).getOrientation().equals("北"))
	                    {
	                        continue;
	                    }else {RoomList.remove(i);i--;}
	                }
	            }

	        }
	        System.out.print(today);
	        OrderList = od.getAllOrder();
	        for(int i = 0; i<OrderList.size();i++)
	        {
	            for(int j = 0;j<RoomList.size();j++)
	            {
	                String roomId = OrderList.get(i).getRoom_id();
	                String roomd = RoomList.get(j).getRoom_id();
	                if(roomId.equals(roomd))
	                {
	                    if(today<OrderList.get(i).getCheckout()&&today>=OrderList.get(i).getCheckin())
	                    {rd.changeRoomEngaged(roomd, 1);RoomList.get(j).setEngaged(1);}
	                }
	            }
	        }
	        request.setAttribute("RoomList", RoomList);
	        RequestDispatcher rd1 = request.getRequestDispatcher("/ManagerShowRoom.jsp");
	        rd1.forward(request, response);
	}

}
