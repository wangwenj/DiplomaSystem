package entity;

public class Vacate {

    private int id_vacate;

    private int id_user;

    private String time;

    private String time_start;

    private String time_end;

    private int id_approval;

    private String reason;

    private String days;

    private String p_name;

    private String d_name;

    public Vacate() {
    }

    public Vacate(int id_vacate, int id_user, String time, String time_start, String time_end, int id_approval, String reason, String days, String p_name, String d_name) {
        this.id_vacate = id_vacate;
        this.id_user = id_user;
        this.time = time;
        this.time_start = time_start;
        this.time_end = time_end;
        this.id_approval = id_approval;
        this.reason = reason;
        this.days = days;
        this.p_name = p_name;
        this.d_name = d_name;
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

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getD_name() {
        return d_name;
    }

    public void setD_name(String d_name) {
        this.d_name = d_name;
    }
}
