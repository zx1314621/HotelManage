package usst.model;

import java.io.Serializable;

//前台接待
public class Receptionist implements Serializable{
    private String receptionist_id;//账号_主键
    private String password;   //密码
    private String name;   //用户姓名
    private String gender;        //性别
    private String idcard;
    private int age;           //年龄
    //带参数的构造函数 直接赋值

    //无参构造函数

    public Receptionist(){

    }

    //以下是封装的getter和setter
    public String getReceptionist_id() {
        return receptionist_id;
    }

    public void setReceptionist_id(String receptionist_id) {
        this.receptionist_id = receptionist_id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public int getAge() {
        return age;
    }

    public void setAge(int age) {
        this.age = age;
    }


    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard;
    }
}

