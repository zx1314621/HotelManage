package usst.controller.Servlet.Receptionist;

import usst.Dao.OrderDao;
import usst.Dao.RoomDao;
import usst.Service.Receptionist.ReceptionistActions;
import usst.model.Order;
import usst.model.Room;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

@WebServlet(name = "ServletCheckOut",urlPatterns = "/checkout.do")
public class ServletCheckOut extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        //1 正在入住，2 订单完成
        ServletContext context=request.getServletContext();
        RoomDao roomDao=new RoomDao((DataSource)context.getAttribute("dataSource"));
        OrderDao orderDao=new OrderDao((DataSource)context.getAttribute("dataSource"));
        ReceptionistActions receptionistActions=new ReceptionistActions((DataSource)context.getAttribute("dataSource"));
        String action=request.getParameter("action");
        HttpSession session=request.getSession();
        //region if (action.equals("checkout_direct"))
        if (action.equals("checkout_direct")){
            String room_id=request.getParameter("room_id");
            Order order=orderDao.getOrderbyRoomStatus(room_id,1);
            //如果要退房的房间 有订单，且订单状态为1 则可以退房，并将状态改为2
            if(order!=null&&orderDao.update_Status(order.getOrder_id(),2)) {
                //退房成功！ 返回账单
                //获得房价

                Room room = roomDao.getRoom(room_id);
                session.setAttribute("bill_room", room);//房间号，订单号，单价
                session.setAttribute("bill_order", order);//时间段，价格
                int duration=(int)receptionistActions.TimeDifference(order.getCheckin(),order.getCheckout());
                session.setAttribute("bill_duration",duration);
                session.setAttribute("checkout_flag","1");
                response.sendRedirect("checkout_direct.jsp");
            }
            else {
                session.setAttribute("checkout_flag","0");
                    response.sendRedirect("checkout_direct.jsp");
            }
            }
            //endregion
        //region else if (action.equals("checkout_prolong"))
            else if (action.equals("checkout_prolong")){
            String order_id=request.getParameter("order_id");
            String day=request.getParameter("day");
            //每个房间有人住的状态是唯一的
            Order order=orderDao.getOrder(order_id);
            if (order!=null&&order.getOrder_id()!=null){
                int old_checkout=order.getCheckout();
                int new_checkout=receptionistActions.TimeAdd(old_checkout,Integer.valueOf(day));
                int new_checkin=order.getCheckout();
                Order new_Order=new Order();
                new_Order.setCheckin(new_checkin);
                new_Order.setCheckout(new_checkout);
                new_Order.setRoomtype(order.getRoomtype());
                //续住，相当于模拟生成一个新订单，若可以，则修改老订单的离店日期
                ArrayList<String> unfit_room=receptionistActions.getUnfitroom(new_Order);
                ArrayList<Room> fit_room=receptionistActions.getFitroom(unfit_room,new_Order.getRoomtype());
                for (int i=0;i<fit_room.size();i++){
                    if (fit_room.get(i).getRoom_id().equals(order.getRoom_id())){
                        RequestDispatcher rd=request.getRequestDispatcher("checkout_xuzhu.jsp");
                        //更新order的离店时间
                        System.out.println("-------可以续住");
                        order.setCheckout(new_checkout);
                        request.setAttribute("day",day);
                        request.setAttribute("order",order);
                        orderDao.update_checkout(order.getOrder_id(),new_checkout);
                        rd.forward(request,response);
                    }
                }
                //如果不能续住，返回错误信息
                session.setAttribute("checkout_xuzhu_fail","续住失败，该房间已排满订单，请换房入住");
                System.out.println("-------不能续住");
                RequestDispatcher rd=request.getRequestDispatcher("checkout_prolong.jsp");
                rd.forward(request,response);
            }
            else {
                session.setAttribute("checkout_xuzhu_fail","输入房间号错误，该房间暂时无人入住");
                RequestDispatcher rd=request.getRequestDispatcher("checkout_prolong.jsp");
                rd.forward(request,response);
            }

        }
        //endregion
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
