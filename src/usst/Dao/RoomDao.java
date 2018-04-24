package usst.Dao;
import usst.model.Customer;
import usst.model.Order;
import usst.model.Room;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class RoomDao {
    private DataSource dataSource;
    public RoomDao(DataSource dataSource){
        this.dataSource=dataSource;
    }
    public ArrayList<Room> getRooms_by_roomtype(String roomtype){
        ArrayList<Room> list=new ArrayList<>();
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        String SQL="select * from room where roomtype=? and engaged != 2";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,roomtype);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                Room room=new Room();
                room.setRoom_id(resultSet.getString("room_id"));
                room.setRoomtype(resultSet.getString("roomtype"));
                room.setOrientation(resultSet.getString("orientation"));
                room.setFloor(resultSet.getInt("floor"));
                room.setPrice(resultSet.getInt("price"));
                room.setOrderNum(resultSet.getInt("orderNum"));
                room.setEngaged(resultSet.getInt("engaged"));
                list.add(room);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Room> lxygetRooms_by_roomtype(String roomtype){
        ArrayList<Room> list=new ArrayList<>();
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        String SQL="select * from room where roomtype=?";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,roomtype);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                Room room=new Room();
                room.setRoom_id(resultSet.getString("room_id"));
                room.setRoomtype(resultSet.getString("roomtype"));
                room.setOrientation(resultSet.getString("orientation"));
                room.setFloor(resultSet.getInt("floor"));
                room.setPrice(resultSet.getInt("price"));
                room.setOrderNum(resultSet.getInt("orderNum"));
                room.setEngaged(resultSet.getInt("engaged"));
                list.add(room);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public Room getRoom(String room_id){
       Room room=new Room();
        Connection con;
        PreparedStatement pstmt;
        ResultSet rs;
        String SQL="select * from room where room_id=? and engaged != 2;";
        try {
            con=dataSource.getConnection();
            pstmt=con.prepareStatement(SQL);
            pstmt.setString(1,room_id);
            rs=pstmt.executeQuery();
            if (rs.next()) {
                room.setRoom_id(rs.getString("room_id"));
                room.setRoomtype(rs.getString("roomtype"));
                room.setOrientation(rs.getString("orientation"));
                room.setFloor(rs.getInt("floor"));
                room.setPrice(rs.getInt("price"));
                room.setOrderNum(rs.getInt("orderNum"));
                room.setEngaged(rs.getInt("engaged"));
            }
            pstmt.close();
            con.close();
        } catch (SQLException e) {
            System.out.println("查找房间信息（获得对象）时发生问题"+e);
        }
        return room;
    }
    public Room lxygetRoom(String room_id){
        Room room=new Room();
         Connection con;
         PreparedStatement pstmt;
         ResultSet rs;
         String SQL="select * from room where room_id=?;";
         try {
             con=dataSource.getConnection();
             pstmt=con.prepareStatement(SQL);
             pstmt.setString(1,room_id);
             rs=pstmt.executeQuery();
             if (rs.next()) {
                 room.setRoom_id(rs.getString("room_id"));
                 room.setRoomtype(rs.getString("roomtype"));
                 room.setOrientation(rs.getString("orientation"));
                 room.setFloor(rs.getInt("floor"));
                 room.setPrice(rs.getInt("price"));
                 room.setOrderNum(rs.getInt("orderNum"));
                 room.setEngaged(rs.getInt("engaged"));
             }
             pstmt.close();
             con.close();
         } catch (SQLException e) {
             System.out.println("查找房间信息（获得对象）时发生问题"+e);
         }
         return room;
     }
    public boolean changeRoomEngaged(String room_id,int change){
         Connection con;
         PreparedStatement pstmt;
         String SQL="UPDATE room SET engaged=? WHERE room_id=?";
         try {
             con=dataSource.getConnection();
             pstmt=con.prepareStatement(SQL);
             pstmt.setInt(1,change);
             pstmt.setString(2,room_id);
             pstmt.executeUpdate();
             pstmt.close();
             con.close();
             return true;
         } catch (SQLException e) {
             System.out.println("更改房间状态时发生问题"+e);
         }
         return false;
     }
    public boolean deleteRoom(String room_id){
        Connection con;
        PreparedStatement pstmt;
        String SQL="DELETE FROM Customer WHERE room_id=?";
        try {
            con=dataSource.getConnection();
            pstmt=con.prepareStatement(SQL);
            pstmt.setString(1,room_id);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println("删除room信息时发生问题"+e);
        }
        return false;
    }
    public boolean updateRoom(Room room){
        Connection con;
        PreparedStatement stmt;
        String SQL="UPDATE room SET roomtype=?,orientation=?,floor=?,price=?,orderNum=?,engaged=? WHERE room_id=?;";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,room.getRoomtype());
            stmt.setString(2,room.getOrientation());
            stmt.setInt(3,room.getFloor());
            stmt.setInt(4,room.getPrice());
            stmt.setInt(5,room.getOrderNum());
            stmt.setInt(6,room.getEngaged());
            stmt.setString(7,room.getRoom_id());
           
            stmt.executeUpdate();
            stmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println("更新room信息时发生问题"+e);
        }
        return false;
    }
    public boolean addRoom(Room room){
        Connection con;
        PreparedStatement pstmt;
        String SQL="Insert into Room(room_id,roomtype,orientation,floor,price,orderNum,engaged) values(?,?,?,?,?,?,?);";
        try {
            con=dataSource.getConnection();
            pstmt=con.prepareStatement(SQL);
            pstmt.setString(1,room.getRoom_id());
            pstmt.setString(2,room.getRoomtype());
            pstmt.setString(3,room.getOrientation());
            pstmt.setInt(4,room.getFloor());
            pstmt.setInt(5,room.getPrice());
            pstmt.setInt(6,0);
            pstmt.setInt(7,0);
            pstmt.executeUpdate();
            pstmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            System.out.println("添加Room时发生问题"+e);
        }
        return false;
    }
    public ArrayList<Room> getAllRoom(){
        ArrayList<Room> list=new ArrayList<>();
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        String SQL="select * from room ";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                Room room=new Room();
                room.setRoom_id(resultSet.getString("room_id"));
                room.setRoomtype(resultSet.getString("roomtype"));
                room.setOrientation(resultSet.getString("orientation"));
                room.setFloor(resultSet.getInt("floor"));
                room.setPrice(resultSet.getInt("price"));
                room.setOrderNum(resultSet.getInt("orderNum"));
                room.setEngaged(resultSet.getInt("engaged"));
                list.add(room);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
    public ArrayList<Room> lxygetAllRoom(){
        ArrayList<Room> list=new ArrayList<>();
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        String SQL="select * from room where engaged != 2;";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                Room room=new Room();
                room.setRoom_id(resultSet.getString("room_id"));
                room.setRoomtype(resultSet.getString("roomtype"));
                room.setOrientation(resultSet.getString("orientation"));
                room.setFloor(resultSet.getInt("floor"));
                room.setPrice(resultSet.getInt("price"));
                room.setOrderNum(resultSet.getInt("orderNum"));
                room.setEngaged(resultSet.getInt("engaged"));
                list.add(room);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }
}
