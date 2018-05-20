package entity;


public class SignInOut {

    private int id;

    private int user_id;//signInOut的user_id

    private String day_str;

    private String sign_time;

    private int operation;

    private String user_name;

    private String status;

    private String operation_name;

    private int id_user;

    public SignInOut(int id_user,String operation_name, String status, int id, int user_id, String day_str, String sign_time, int operation, String user_name) {
        this.id = id;
        this.user_id = user_id;
        this.day_str = day_str;
        this.sign_time = sign_time;
        this.operation = operation;
        this.user_name = user_name;
        this.status = status;
        this.operation_name = operation_name;
        this.id_user=id_user;
    }

    public SignInOut() {

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

    public String getDay_str() {
        return day_str;
    }

    public void setDay_str(String day_str) {
        this.day_str = day_str;
    }

    public String getSign_time() {
        return sign_time;
    }

    public void setSign_time(String sign_time) {
        this.sign_time = sign_time;
    }

    public int getOperation() {
        return operation;
    }

    public void setOperation(int operation) {
        this.operation = operation;
    }

    public String getUser_name() {
        return user_name;
    }

    public void setUser_name(String user_name) {
        this.user_name = user_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getOperation_name() {
        return operation_name;
    }

    public void setOperation_name(String operation_name) {
        this.operation_name = operation_name;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
}
