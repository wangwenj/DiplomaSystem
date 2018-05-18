package dao;

import entity.User;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by ${mjy} on 2018/5/6.
 */
public interface UserDao_1 {
    User getOne(String id_user);

    int add(int id_user, String password, String name, String gender, int id_department, int id_position, String tel, String address);

    int updateUser(String name, String gender, int id_department, int id_position, String tel, String address, int id_user);

    List<User> getAll();

    List<User> getAllManager();

    void deleteUser(int id_user);

    User countUser(String name);

    User countId(int id);

    User checkUserExist(String name);
}
