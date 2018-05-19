package entity;

public class Vacate {

    private int id_vacate;

    private int id_user;

    private String apply_name;//申请人的姓名

    private String time;//申请时间

    private String time_start;

    private String time_end;

    private int id_approval;

    private String admin_name;//审批人姓名

    private String reason;

    private String days;

    private int apply_depart_id;

    private String apply_depart_name;//申请部门名字

    private int apply_posi_id;

    private String apply_posi_name;//申请职位名字

    private int admin_posi_id;

    private String admin_posi_name;//审核人职位名字

    private String status;


    public Vacate() {
    }

    public Vacate(int id_vacate, int id_user, String time, String time_start, String time_end, int id_approval,
                  String reason, String days, String apply_name, String admin_name,
                  int apply_depart_id, int apply_posi_id, int admin_posi_id,
                  String apply_depart_name, String apply_posi_name, String admin_posi_name,String status) {
        this.id_vacate = id_vacate;
        this.id_user = id_user;
        this.time = time;
        this.time_start = time_start;
        this.time_end = time_end;
        this.id_approval = id_approval;
        this.reason = reason;
        this.days = days;
        this.apply_name = apply_name;
        this.admin_name = admin_name;
        this.apply_depart_id = apply_depart_id;
        this.apply_posi_id = apply_posi_id;
        this.admin_posi_id = admin_posi_id;
        this.apply_depart_name = apply_depart_name;
        this.apply_posi_name = apply_posi_name;
        this.admin_posi_name = admin_posi_name;
        this.status=status;
    }

    public int getId_vacate() {
        return id_vacate;
    }

    public void setId_vacate(int id_vacate) {
        this.id_vacate = id_vacate;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getTime_start() {
        return time_start;
    }

    public void setTime_start(String time_start) {
        this.time_start = time_start;
    }

    public String getTime_end() {
        return time_end;
    }

    public void setTime_end(String time_end) {
        this.time_end = time_end;
    }

    public int getId_approval() {
        return id_approval;
    }

    public void setId_approval(int id_approval) {
        this.id_approval = id_approval;
    }

    public String getReason() {
        return reason;
    }

    public void setReason(String reason) {
        this.reason = reason;
    }

    public String getDays() {
        return days;
    }

    public void setDays(String days) {
        this.days = days;
    }


    public String getApply_name() {
        return apply_name;
    }

    public void setApply_name(String apply_name) {
        this.apply_name = apply_name;
    }

    public String getAdmin_name() {
        return admin_name;
    }

    public void setAdmin_name(String admin_name) {
        this.admin_name = admin_name;
    }

    public int getApply_depart_id() {
        return apply_depart_id;
    }

    public void setApply_depart_id(int apply_depart_id) {
        this.apply_depart_id = apply_depart_id;
    }

    public int getApply_posi_id() {
        return apply_posi_id;
    }

    public void setApply_posi_id(int apply_posi_id) {
        this.apply_posi_id = apply_posi_id;
    }

    public int getAdmin_posi_id() {
        return admin_posi_id;
    }

    public void setAdmin_posi_id(int admin_posi_id) {
        this.admin_posi_id = admin_posi_id;
    }

    public String getApply_depart_name() {
        return apply_depart_name;
    }

    public void setApply_depart_name(String apply_depart_name) {
        this.apply_depart_name = apply_depart_name;
    }

    public String getApply_posi_name() {
        return apply_posi_name;
    }

    public void setApply_posi_name(String apply_posi_name) {
        this.apply_posi_name = apply_posi_name;
    }

    public String getAdmin_posi_name() {
        return admin_posi_name;
    }

    public void setAdmin_posi_name(String admin_posi_name) {
        this.admin_posi_name = admin_posi_name;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
