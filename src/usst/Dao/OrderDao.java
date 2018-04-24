package usst.Dao;
import usst.model.Order;

import javax.sql.DataSource;
import java.sql.*;
import java.util.ArrayList;

public class OrderDao  {

    private DataSource dataSource;
    public OrderDao(DataSource dataSource){
        this.dataSource=dataSource;
    }
    //通过身份证 集合类
    public ArrayList<Order> getOrdersBy_idcard(String idcard){
      ArrayList<Order> list=new ArrayList<>();
      Connection con;
      PreparedStatement stmt;
      ResultSet resultSet;
      String SQL="select * from orders where idcard=?";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,idcard);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                Order order=new Order();
                order.setOrder_id(resultSet.getString("order_id"));
                order.setIdcard(resultSet.getString("idcard"));
                order.setCustomerName(resultSet.getString("customerName"));
                order.setCheckin(resultSet.getInt("checkin"));
                order.setCheckout(resultSet.getInt("checkout"));
                order.setRoom_id(resultSet.getString("room_id"));
                order.setProcessed(resultSet.getInt("processed"));
                order.setRequirement(resultSet.getString("requirement"));
                order.setRoomtype(resultSet.getString("roomtype"));
                list.add(order);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Order getOrder(String order_id){
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        Order order=null;
        String SQL="select * from Orders where order_id=?";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,order_id);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                order=new Order();
                order.setRoom_id(resultSet.getString("room_id"));
                order.setOrder_id(resultSet.getString("order_id"));
                order.setIdcard(resultSet.getString("idcard"));
                order.setCustomerName(resultSet.getString("customerName"));
                order.setCheckin(Integer.valueOf(resultSet.getString("checkin")));
                order.setCheckout(Integer.valueOf(resultSet.getString("checkout")));
                order.setRoomtype(resultSet.getString("roomtype"));
                order.setRequirement(resultSet.getString("requirement"));
                order.setProcessed(resultSet.getInt("processed"));
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
    public Order getOrderbyRoomStatus(String room_id,int processed){
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        Order order=null;
        String SQL="select * from Orders where room_id=? and processed=?";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,room_id);
            stmt.setInt(2,processed);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                order=new Order();
                order.setRoom_id(resultSet.getString("room_id"));
                order.setOrder_id(resultSet.getString("order_id"));
                order.setIdcard(resultSet.getString("idcard"));
                order.setCustomerName(resultSet.getString("customerName"));
                order.setCheckin(Integer.valueOf(resultSet.getString("checkin")));
                order.setCheckout(Integer.valueOf(resultSet.getString("checkout")));
                order.setRoomtype(resultSet.getString("roomtype"));
                order.setRequirement(resultSet.getString("requirement"));
                order.setProcessed(resultSet.getInt("processed"));
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return order;
    }
    public boolean addOrder(Order order){
        Connection con;
        PreparedStatement stmt;
        String SQL="Insert into Orders(order_id,idcard,customerName,checkin,checkout,roomtype,requirement,room_id,processed) values(?,?,?,?,?,?,?,?,?);";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,order.getOrder_id());
            stmt.setString(2,order.getIdcard());
            stmt.setString(3,order.getCustomerName());
            stmt.setInt(4,order.getCheckin());
            stmt.setInt(5,order.getCheckout());
            stmt.setString(6,order.getRoomtype());
            stmt.setString(7,order.getRequirement());
            stmt.setString(8,order.getRoom_id());
            stmt.setInt(9,order.getProcessed());
            stmt.executeUpdate();
            stmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public boolean deleteOrder(String order_id){
        Connection con;
        PreparedStatement pstmt;
        String SQL="DELETE FROM Orders WHERE order_id=?";
        try {
            con=dataSource.getConnection();
            pstmt=con.prepareStatement(SQL);
            pstmt.setString(1,order_id);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println("删除客户信息时发生问题"+e);
        }
        return false;
    }
    public ArrayList<Order> getOrderbybStatus(int processed){
        ArrayList<Order> list=new ArrayList<>();
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        Order order=null;
        String SQL="select * from Orders where processed=?";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setInt(1,processed);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                order=new Order();
                order.setRoom_id(resultSet.getString("room_id"));
                order.setOrder_id(resultSet.getString("order_id"));
                order.setIdcard(resultSet.getString("idcard"));
                order.setCustomerName(resultSet.getString("customerName"));
                order.setCheckin(Integer.valueOf(resultSet.getString("checkin")));
                order.setCheckout(Integer.valueOf(resultSet.getString("checkout")));
                order.setRoomtype(resultSet.getString("roomtype"));
                order.setRequirement(resultSet.getString("requirement"));
                order.setProcessed(resultSet.getInt("processed"));
                list.add(order);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    
    //前台分配房间，相当于修改 订单的room_id
    public boolean update_Room_id(String order_id,String room_id){
        Connection con;
        PreparedStatement pstmt;
        String SQL="UPDATE Orders SET room_id=? WHERE order_id=?";
        try {
            con=dataSource.getConnection();
            pstmt=con.prepareStatement(SQL);
            pstmt.setString(1, room_id);
            pstmt.setString(2, order_id);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println("更新客户信息时发生问题"+e);
        }
        return false;
    }
    public boolean update_Order(Order order){
        Connection con;
        PreparedStatement pstmt;
        String SQL="UPDATE orders SET idcard=?, customerName=? ,checkin=? ,checkout=? ,room_id=?,processed=? ,requirement=?, roomtype=? WHERE order_id=?;";
        try {
            con=dataSource.getConnection();
            pstmt=con.prepareStatement(SQL);
            pstmt.setString(1, order.getIdcard());
            pstmt.setString(2, order.getCustomerName());
            pstmt.setInt(3, order.getCheckin());
            pstmt.setInt(4, order.getCheckout());
            pstmt.setString(5, order.getRoom_id());
            pstmt.setInt(6, order.getProcessed());
            pstmt.setString(7, order.getRequirement());
            pstmt.setString(8, order.getRoomtype());
            pstmt.setString(9, order.getRoom_id());
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println("更新客户信息时发生问题"+e);
        }
        return false;
    }
    public boolean update_Status (String order_id,int processed){
        Connection con;
        PreparedStatement pstmt;
        String SQL="UPDATE Orders SET processed=? WHERE order_id=?;";
        try {
            con=dataSource.getConnection();
            pstmt=con.prepareStatement(SQL);
            pstmt.setInt(1, processed);
            pstmt.setString(2, order_id);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println("更新Order信息时发生问题"+e);
        }
        return false;
    }
    public boolean update_checkout (String order_id,int checkout){
        Connection con;
        PreparedStatement pstmt;
        String SQL="UPDATE Orders SET checkout=? WHERE order_id=?;";
        try {
            con=dataSource.getConnection();
            pstmt=con.prepareStatement(SQL);
            pstmt.setInt(1, checkout);
            pstmt.setString(2, order_id);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println("更新Order信息时发生问题"+e);
        }
        return false;
    }
    public ArrayList<Order> getOrders_by_roomtype(String roomtype){
        ArrayList<Order> list=new ArrayList<>();
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        String SQL="select * from orders where roomtype=?";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);;
            stmt.setString(1,roomtype);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                Order order=new Order();
                order.setOrder_id(resultSet.getString("order_id"));
                order.setIdcard(resultSet.getString("idcard"));
                order.setRequirement(resultSet.getString("requirement"));
                order.setCustomerName(resultSet.getString("customerName"));
                order.setCheckin(Integer.valueOf(resultSet.getString("checkin")));
                order.setCheckout(Integer.valueOf(resultSet.getString("checkout")));
                order.setRoomtype(resultSet.getString("roomtype"));
                order.setRoom_id(resultSet.getString("room_id"));
                order.setProcessed(resultSet.getInt("processed"));
                list.add(order);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
            System.out.println("orderDao出错");
        }
        return list;
    }
    public ArrayList<Order> getAllOrder(){
        ArrayList<Order> list=new ArrayList<>();
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        String SQL="select * from orders ";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                Order order=new Order();
                order.setOrder_id(resultSet.getString(1));
                order.setIdcard(resultSet.getString(2));
                order.setCustomerName(resultSet.getString(3));
                order.setCheckin(resultSet.getInt(4));
                order.setCheckout(resultSet.getInt(5));
                order.setRoom_id(resultSet.getString(6));
                order.setProcessed(resultSet.getInt(7));
                order.setRequirement(resultSet.getString(8));
                order.setRoomtype(resultSet.getString(9));
                list.add(order);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
