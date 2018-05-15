package daoImp;

import dao.DAO;
import dao.UserDao_1;
import entity.User;

import java.math.BigDecimal;
import java.util.List;

/**
 * Created by ${mjy} on 2018/5/6.
 */
public class UserDao1Imp extends DAO<User> implements UserDao_1 {
    @Override
    public User getOne(String id_user) {
        String sql="select * from USER where id_user=?";
        User userEntity1 =(User)get(sql,id_user);
        return userEntity1;
    }

    @Override
    public int add(int id_user, String password,String name, String gender, int id_department, int id_position, String tel, String intro, String remark,String address) {
        String sql="INSERT INTO USER (id_user,password,name,gender,id_department,id_position,tel,intro,remark,address) VALUES (?,?,?,?,?,?,?,?,?,?)";
        return update(sql,id_user,password,name,gender,id_department,id_position,tel,intro,remark,address);

    }

    @Override
    public int updateUser(String name, String gender, int id_department, int id_position, String tel, String address,int id_user) {
        String sql="update user set name=?,gender=?,id_department=?,id_position=?,tel=?,address=? where id_user=?";
        return update(sql,name,gender,id_department,id_position,tel,address,id_user);
    }


    @Override
    public List<User> getAll() {
        String sql="SELECT `USER`.ID_USER,`USER`.`NAME`,`USER`.TEL,`USER`.INTRO,`USER`.ADDRESS,`USER`.REMARK,`USER`.GENDER,POSITION.ID_POSITION,POSITION.P_NAME,DEPARTMENT.ID_DEPARTMENT,DEPARTMENT.D_NAME FROM ((`USER`INNER JOIN POSITION ON `USER`.ID_POSITION=POSITION.ID_POSITION) INNER JOIN DEPARTMENT ON `USER`.ID_DEPARTMENT=DEPARTMENT.ID_DEPARTMENT)";
        return getForList(sql);
    }

    @Override
    public void deleteUser(int id_user) {
        String sql="delete from user where id_user=?";
        update(sql,id_user);
    }

    @Override
    public BigDecimal countUser(String name) {
        String sql="select count(*) from user where name=?";
        return getForValue(sql,name);
    }
}
