package entity;

public class Position {
    private int id_position;
    private String p_name;
    private String intro;

    public String getIntro() {
        return intro;
    }

    public void setIntro(String intro) {
        this.intro = intro;
    }

    public Position() {
    }

    public Position(int id_position, String p_name, String intro) {
        this.id_position = id_position;
        this.p_name = p_name;
        this.intro = intro;
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

}
