package entity;

public class DepartmentDelete {
    private int id_department;
    private String d_name;
    private String intro;
    private String address;
    private String tel;
    private String delete_time_depart;

    public DepartmentDelete() {
    }

    public DepartmentDelete(int id_department, String d_name, String intro, String address, String tel, String delete_time_depart) {
        this.id_department = id_department;
        this.d_name = d_name;
        this.intro = intro;
        this.address = address;
        this.tel = tel;
        this.delete_time_depart = delete_time_depart;
    }

    public int getId_department() {
        return id_department;
    }

    public void setId_department(int id_department) {
        this.id_department = id_department;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
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

    public String getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public String getDelete_time_depart() {
        return delete_time_depart;
    }

    public void setDelete_time_depart(String delete_time_depart) {
        this.delete_time_depart = delete_time_depart;
    }
}
