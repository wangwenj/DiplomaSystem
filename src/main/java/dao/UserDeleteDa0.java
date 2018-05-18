package dao;

import entity.UserDelete;

import java.util.List;

public interface UserDeleteDa0 {

    int add_user_delete(int id_user, String password, String name, String gender, int id_department, int id_position, String tel, String address,String intro,String remark,String time,String role);

    void delete_user_delete(int id_user);

    List<UserDelete> getAll();

    UserDelete getOne(int id);
}
