package entity;

public class User{
    private int id_user;
    private String password;
    private String name;
    private String tel;
    private String intro;
    private String address;
    private int id_department;
    private int id_position;
    private String remark;
    private String gender;
    private String d_name;
    private String p_name;

    public User() {
    }

    public User(int id_user, String password, String name, String tel, String intro, String address, int id_department, int id_position, String remark, String gender, String d_name, String p_name) {
        this.id_user = id_user;
        this.password = password;
        this.name = name;
        this.tel = tel;
        this.intro = intro;
        this.address = address;
        this.id_department = id_department;
        this.id_position = id_position;
        this.remark = remark;
        this.gender = gender;
        this.d_name = d_name;
        this.p_name = p_name;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getId_department() {
        return id_department;
    }

    public void setId_department(int id_department) {
        this.id_department = id_department;
    }

    public int getId_position() {
        return id_position;
    }

    public void setId_position(int id_position) {
        this.id_position = id_position;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    @Override
    public String toString() {
        return "UserEntity_1{" +
                "id_user='" + id_user + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
