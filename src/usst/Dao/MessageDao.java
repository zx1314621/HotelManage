package usst.Dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.sql.DataSource;

import usst.model.Message;
import usst.model.Order;
import usst.model.Room;

public class MessageDao {
	private DataSource dataSource;
	public MessageDao(DataSource dataSource)
	{
		this.dataSource=dataSource;
	}
	public boolean addMessage(Message message)
	{
		 Connection con;
	        PreparedStatement pstmt;
	        String SQL="Insert into message(order_id,customer_id,name,message,room_id,roomtype,level) values(?,?,?,?,?,?,?);";
	        try {
	            con=dataSource.getConnection();
	            pstmt=con.prepareStatement(SQL);
	            pstmt.setString(1,message.getOrder_id());
	            pstmt.setString(2,message.getCustomer_id());
	            pstmt.setString(3,message.getName());
	            pstmt.setString(4,message.getMessage());
	            pstmt.setString(5,message.getRoom_id());
	            pstmt.setString(6,message.getRoomtype());
	            pstmt.setInt(7,message.getLevel());
	            pstmt.executeUpdate();
	            pstmt.close();
	            con.close();
	            return true;
	        } catch (SQLException e) {
	            System.out.println("添加Message时发生问题"+e);
	        }
	        return false;
		
	}
	public ArrayList<Message> getAllMessage(){
        ArrayList<Message> messageList=new ArrayList<Message>();
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        String SQL="select * from message ";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            resultSet=stmt.executeQuery();
            while (resultSet.next()){
                Message message = new Message();
                message.setOrder_id(resultSet.getString(1));
                message.setCustomer_id(resultSet.getString(2));
                message.setName(resultSet.getString(3));
                message.setMessage(resultSet.getString(4));
                message.setRoom_id(resultSet.getString(5));
                message.setRoomtype(resultSet.getString(6));
                message.setLevel(resultSet.getInt(7));
                messageList.add(message);
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
        	System.out.println("获取全部Message时发生问题"+e);
        }
        return messageList;
    }
	  public ArrayList<Message> getMessageBy_roomtype(String roomtype){
	      ArrayList<Message> messageList=new ArrayList<Message>();
	      Connection con;
	      PreparedStatement stmt;
	      ResultSet resultSet;
	      String SQL="select * from message where roomtype=?";
	        try {
	            con=dataSource.getConnection();
	            stmt=con.prepareStatement(SQL);
	            stmt.setString(1,roomtype);
	            resultSet=stmt.executeQuery();
	            while (resultSet.next()){
	            	Message message = new Message();
	                message.setOrder_id(resultSet.getString(1));
	                message.setCustomer_id(resultSet.getString(2));
	                message.setName(resultSet.getString(3));
	                message.setMessage(resultSet.getString(4));
	                message.setRoom_id(resultSet.getString(5));
	                message.setRoomtype(resultSet.getString(6));
	                message.setLevel(resultSet.getInt(7));
	                messageList.add(message);
	            }
	            stmt.close();
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return messageList;
	    }
	  public ArrayList<Message> getMessageBy_roomId(String room_id){
	      ArrayList<Message> messageList=new ArrayList<Message>();
	      Connection con;
	      PreparedStatement stmt;
	      ResultSet resultSet;
	      String SQL="select * from message where room_id=?";
	        try {
	            con=dataSource.getConnection();
	            stmt=con.prepareStatement(SQL);
	            stmt.setString(1,room_id);
	            resultSet=stmt.executeQuery();
	            while (resultSet.next()){
	            	Message message = new Message();
	                message.setOrder_id(resultSet.getString(1));
	                message.setCustomer_id(resultSet.getString(2));
	                message.setName(resultSet.getString(3));
	                message.setMessage(resultSet.getString(4));
	                message.setRoom_id(resultSet.getString(5));
	                message.setRoomtype(resultSet.getString(6));
	                message.setLevel(resultSet.getInt(7));
	                messageList.add(message);
	            }
	            stmt.close();
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return messageList;
	    }
	  public ArrayList<Message> getMessageBy_CustomerId(String customer_id){
	      ArrayList<Message> messageList=new ArrayList<Message>();
	      Connection con;
	      PreparedStatement stmt;
	      ResultSet resultSet;
	      String SQL="select * from message where customer_id=?";
	        try {
	            con=dataSource.getConnection();
	            stmt=con.prepareStatement(SQL);
	            stmt.setString(1,customer_id);
	            resultSet=stmt.executeQuery();
	            while (resultSet.next()){
	            	Message message = new Message();
	                message.setOrder_id(resultSet.getString(1));
	                message.setCustomer_id(resultSet.getString(2));
	                message.setName(resultSet.getString(3));
	                message.setMessage(resultSet.getString(4));
	                message.setRoom_id(resultSet.getString(5));
	                message.setRoomtype(resultSet.getString(6));
	                message.setLevel(resultSet.getInt(7));
	                messageList.add(message);
	            }
	            stmt.close();
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return messageList;
	    }
	  public Message getMessageBy_OrderId(String order_id){
	      Connection con;
	      PreparedStatement stmt;
	      ResultSet resultSet;
	      Message message = new Message();
	      String SQL="select * from message where order_id=?";
	        try {
	            con=dataSource.getConnection();
	            stmt=con.prepareStatement(SQL);
	            stmt.setString(1,order_id);
	            resultSet=stmt.executeQuery();
	            while (resultSet.next()){
	                message.setOrder_id(resultSet.getString(1));
	                message.setCustomer_id(resultSet.getString(2));
	                message.setName(resultSet.getString(3));
	                message.setMessage(resultSet.getString(4));
	                message.setRoom_id(resultSet.getString(5));
	                message.setRoomtype(resultSet.getString(6));
	                message.setLevel(resultSet.getInt(7));
	            }
	            stmt.close();
	            con.close();
	        } catch (SQLException e) {
	            e.printStackTrace();
	        }
	        return message;
	    }
	  public boolean deleteMessage(String customer_id,String message){
	        Connection con;
	        PreparedStatement pstmt;
	        String SQL="DELETE FROM Message WHERE customer_id=? and message =?";
	        try {
	            con=dataSource.getConnection();
	            pstmt=con.prepareStatement(SQL);
	            pstmt.setString(1,customer_id);
	            pstmt.setString(2,message);
	            pstmt.executeUpdate();
	            pstmt.close();
	            con.close();
	            return true;
	        } catch (SQLException e) {
	            System.out.println("删除message信息时发生问题"+e);
	        }
	        return false;
	    }

}
