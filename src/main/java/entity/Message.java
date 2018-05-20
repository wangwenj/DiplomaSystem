package entity;

public class Message {
    private int id_message;
    private String write_content;
    private String write_name;
    private String write_time;
    private String reply_time;
    private String reply_content;
    private String reply_name;
    public Message() {
    }

    public Message(int id_message, String write_content, String write_name, String write_time, String reply_time, String reply_content, String reply_name) {
        this.id_message = id_message;
        this.write_content = write_content;
        this.write_name = write_name;
        this.write_time = write_time;
        this.reply_time = reply_time;
        this.reply_content = reply_content;
        this.reply_name = reply_name;
    }

    public int getId_message() {
        return id_message;
    }

    public void setId_message(int id_message) {
        this.id_message = id_message;
    }

    public String getWrite_content() {
        return write_content;
    }

    public void setWrite_content(String write_content) {
        this.write_content = write_content;
    }

    public String getWrite_name() {
        return write_name;
    }

    public void setWrite_name(String write_name) {
        this.write_name = write_name;
    }

    public String getWrite_time() {
        return write_time;
    }

    public void setWrite_time(String write_time) {
        this.write_time = write_time;
    }

    public String getReply_time() {
        return reply_time;
    }

    public void setReply_time(String reply_time) {
        this.reply_time = reply_time;
    }

    public String getReply_content() {
        return reply_content;
    }

    public void setReply_content(String reply_content) {
        this.reply_content = reply_content;
    }

    public String getReply_name() {
        return reply_name;
    }

    public void setReply_name(String reply_name) {
        this.reply_name = reply_name;
    }
}
