package entity;

public class Position {
    private int id_position;
    private String p_name;

    public Position() {
    }

    public Position(int id_position, String p_name) {
        this.id_position = id_position;
        this.p_name = p_name;
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
