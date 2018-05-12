package dao;

import entity.Department;
import entity.Position;
import entity.User;

import java.util.List;

/**
 * Created by ${mjy} on 2018/5/6.
 */
public interface UserDao_1 {
     User getOne(String id_user);
     int add(int id_user,String name,String gender,int id_department,int id_position,int tel,String intro,String remark);
     List<User> getAll();

}
