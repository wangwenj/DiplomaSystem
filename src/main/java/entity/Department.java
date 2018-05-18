package entity;

public class Department {
    private int id_department;
    private String d_name;
    private String intro;
    private String address;
    private String tel;

    public Department() {
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

    public String  getTel() {
        return tel;
    }

    public void setTel(String tel) {
        this.tel = tel;
    }

    public Department(int id_department, String d_name, String intro, String address, String tel) {
        this.id_department = id_department;
        this.d_name = d_name;
        this.intro = intro;
        this.address = address;
        this.tel = tel;
    }
}
