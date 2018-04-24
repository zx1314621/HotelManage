package usst.Dao;
import usst.model.Receptionist;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class ReceptionistDao {
    //添加前台
    private DataSource dataSource;
    public ReceptionistDao(DataSource dataSource){
        this.dataSource=dataSource;
    }
    public boolean addReceptionist(Receptionist receptionist){
        Connection con;
        PreparedStatement stmt;
        String SQL="Insert into Receptionist(receptionist_id,password,name,gender,age,idcard) values(?,?,?,?,?,?);";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,receptionist.getReceptionist_id());
            stmt.setString(2,receptionist.getPassword());
            stmt.setString(3,receptionist.getName());
            stmt.setString(4,receptionist.getGender());
            stmt.setInt(5,receptionist.getAge());
            stmt.setString(6,receptionist.getIdcard());
            stmt.executeUpdate();
            stmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    public ArrayList<Receptionist> getReceptionist()
    {
        ResultSet rs = null;
        ArrayList<Receptionist> Receptionist = new ArrayList<Receptionist>();
        String sql = "select * from Receptionist";
        try {
            Connection conn = dataSource.getConnection();
            PreparedStatement pstmt = conn.prepareStatement(sql);
            rs =pstmt.executeQuery();

            while(rs.next())
            {
                Receptionist temp=new Receptionist();
                temp.setReceptionist_id(rs.getString(1));
                temp.setPassword(rs.getString(2));
                temp.setIdcard(rs.getString(3));
                temp.setName(rs.getString(4));
                temp.setGender(rs.getString(5));
                temp.setAge(rs.getInt(6));
                Receptionist.add(temp);
            }
            pstmt.close();
            conn.close();
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return Receptionist;
    }
//更新所有 更新时 输入框需要填入修改前的值作为默认值
    public boolean update(Receptionist receptionist){
        Connection con;
        PreparedStatement stmt;
        //String Builder .apend
        String SQL="UPDATE Receptionist SET password=?,name=?,gender=?,age=?,idcard=? WHERE receptionist_id=?";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,receptionist.getPassword());
            stmt.setString(2,receptionist.getName());
            stmt.setString(3,receptionist.getGender());
            stmt.setInt(4,receptionist.getAge());
            stmt.setString(5,receptionist.getIdcard());
            stmt.setString(6,receptionist.getReceptionist_id());
            stmt.executeUpdate();
            stmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }

    //得到 前台对象
    public Receptionist getReceptionist(String receptionist_id){
        Receptionist receptionist=null;
        Connection con;
        PreparedStatement stmt;
        ResultSet resultSet;
        String SQL="select * from Receptionist where receptionist_id=?;";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,receptionist_id);
            resultSet=stmt.executeQuery();
            if (resultSet.next()){
            	receptionist=new Receptionist();
                receptionist.setReceptionist_id(resultSet.getString("receptionist_id"));
                receptionist.setPassword(resultSet.getString("password"));
                receptionist.setName(resultSet.getString("name"));
                receptionist.setGender(resultSet.getString("gender"));
                receptionist.setAge(resultSet.getInt("age"));
                receptionist.setIdcard(resultSet.getString("idcard"));
            }
            stmt.close();
            con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return receptionist;
    }

    public boolean deleteReceptionist(String receptionist_id){
        Connection con;
        PreparedStatement stmt;
        String SQL="DELETE FROM Receptionist WHERE receptionist_id=?";
        try {
            con=dataSource.getConnection();
            stmt=con.prepareStatement(SQL);
            stmt.setString(1,receptionist_id);
            stmt.executeUpdate();
            stmt.close();
            con.close();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}

