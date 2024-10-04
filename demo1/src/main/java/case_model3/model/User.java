package case_model3.model;

import java.util.Date;

public class User {
    private int user_id;
    private String name;
    private Date date;
    private Date date_of_birth;
    private String email;
    private String phone;
    private int role_id;
    public User(){}
    public User(int user_id,String user_name,Date user_date,Date date_of_birth,String email,String phone_number,int role_id){
        this.user_id=user_id;
        this.name=user_name;
        this.date =user_date;
        this.date_of_birth=date_of_birth;
        this.email=email;
        this.phone =phone_number;
        this.role_id=role_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return name;
    }

    public void setUser_name(String user_name) {
        this.name = user_name;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public Date getDate_of_birth() {
        return date_of_birth;
    }

    public void setDate_of_birth(Date date_of_birth) {
        this.date_of_birth = date_of_birth;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phone;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phone = phoneNumber;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }
}
