package entity;

public class Notice {
    private int id_announcement;
    private int id_user;
    private String content;
    private String time_submit;
    private int id_admin;
    private String time_approval;
    private String title;
    private String status;
    private String write_name;
    private String reply_name;

    public Notice() {
    }

    public Notice(int id_announcement, int id_user, String content, String time_submit, int id_admin, String time_approval, String title, String status, String write_name, String reply_name) {
        this.id_announcement = id_announcement;
        this.id_user = id_user;
        this.content = content;
        this.time_submit = time_submit;
        this.id_admin = id_admin;
        this.time_approval = time_approval;
        this.title = title;
        this.status = status;
        this.write_name = write_name;
        this.reply_name = reply_name;
    }

    public int getId_announcement() {
        return id_announcement;
    }

    public void setId_announcement(int id_announcement) {
        this.id_announcement = id_announcement;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getTime_submit() {
        return time_submit;
    }

    public void setTime_submit(String time_submit) {
        this.time_submit = time_submit;
    }

    public int getId_admin() {
        return id_admin;
    }

    public void setId_admin(int id_admin) {
        this.id_admin = id_admin;
    }

    public String getTime_approval() {
        return time_approval;
    }

    public void setTime_approval(String time_approval) {
        this.time_approval = time_approval;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getWrite_name() {
        return write_name;
    }

    public void setWrite_name(String write_name) {
        this.write_name = write_name;
    }

    public String getReply_name() {
        return reply_name;
    }

    public void setReply_name(String reply_name) {
        this.reply_name = reply_name;
    }
}
