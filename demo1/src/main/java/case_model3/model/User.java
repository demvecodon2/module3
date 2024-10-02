package case_model3.model;

import java.util.Date;

public class User {
    private int user_id;
    private String user_name;
    private Date user_date;
    private Date date_of_birth;
    private String email;
    private String phone_number;
    private int role_id;
    public User(){}
    public User(int user_id,String user_name,Date user_date,Date date_of_birth,String email,String phone_number,int role_id){
        this.user_id=user_id;
        this.user_name=user_name;
        this.user_date=user_date;
        this.date_of_birth=date_of_birth;
        this.email=email;
        this.phone_number=phone_number;
        this.role_id=role_id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public Date getUser_date() {
        return user_date;
    }

    public void setUser_date(Date user_date) {
        this.user_date = user_date;
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

    public String getPhone_number() {
        return phone_number;
    }

    public void setPhone_number(String phone_number) {
        this.phone_number = phone_number;
    }

    public int getRole_id() {
        return role_id;
    }

    public void setRole_id(int role_id) {
        this.role_id = role_id;
    }
}
