package entity;

public class PositonDelete {
    private  int id_position;
    private String p_name;
    private String intro;
    private String delete_time_position;

    public PositonDelete() {
    }

    public PositonDelete(int id_position, String p_name, String intro, String delete_time_position) {
        this.id_position = id_position;
        this.p_name = p_name;
        this.intro = intro;
        this.delete_time_position = delete_time_position;
    }

    public int getId_position() {
        return id_position;
    }

    public void setId_position(int id_position) {
        this.id_position = id_position;
    }

    public String getP_name() {
        return p_name;
    }

    public void setP_name(String p_name) {
        this.p_name = p_name;
    }

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public String getDelete_time_position() {
        return delete_time_position;
    }

    public void setDelete_time_position(String delete_time_position) {
        this.delete_time_position = delete_time_position;
    }
}
