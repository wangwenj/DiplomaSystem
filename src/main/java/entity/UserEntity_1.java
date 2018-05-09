package entity;

public class UserEntity_1 {
    private String id_user;
    private String password;
    public String getId_user() {
        return id_user;
    }

    public void setId_user(String id_user) {
        this.id_user = id_user;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public UserEntity_1() {
    }

    public UserEntity_1(String id_user, String password) {
        this.id_user = id_user;
        this.password = password;
    }

    @Override
    public String toString() {
        return "UserEntity_1{" +
                "id_user='" + id_user + '\'' +
                ", password='" + password + '\'' +
                '}';
    }
}
