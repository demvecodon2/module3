package case_model3.model;

public class Account {
    private int id;
     private int user_id;
     private String account_name;
     private String account_password;
     public Account(){}
     public Account (int id, int user_id, String account_name, String account_password) {
         this.id = id;
         this.user_id = user_id;
         this.account_name = account_name;
         this.account_password = account_password;
     }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUser_id() {
        return user_id;
    }

    public void setUser_id(int user_id) {
        this.user_id = user_id;
    }

    public String getAccount_name() {
        return account_name;
    }

    public void setAccount_name(String account_name) {
        this.account_name = account_name;
    }

    public String getAccount_password() {
        return account_password;
    }

    public void setAccount_password(String account_password) {
        this.account_password = account_password;
    }
}
