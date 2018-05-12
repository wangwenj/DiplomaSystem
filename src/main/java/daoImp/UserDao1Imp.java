package daoImp;

import com.sun.jndi.cosnaming.IiopUrl;
import dao.DAO;
import dao.UserDao_1;
import entity.Department;
import entity.Position;
import entity.User;
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
    public int add(int id_user, String name, String gender, int id_department, int id_position, String tel, String intro, String remark,String address) {
        String sql="INSERT INTO USER (id_user,name,gender,id_department,id_position,tel,intro,remark,address) VALUES (?,?,?,?,?,?,?,?,?)";
        return update(sql,id_user,name,gender,id_department,id_position,tel,intro,remark,address);

    }

    @Override
    public List<User> getAll() {
        String sql="SELECT `USER`.ID_USER,`USER`.`NAME`,`USER`.TEL,`USER`.INTRO,`USER`.ADDRESS,`USER`.REMARK,`USER`.GENDER,POSITION.P_NAME,DEPARTMENT.D_NAME FROM ((`USER`INNER JOIN POSITION ON `USER`.ID_POSITION=POSITION.ID_POSITION) INNER JOIN DEPARTMENT ON `USER`.ID_DEPARTMENT=DEPARTMENT.ID_DEPARTMENT)";
        return getForList(sql);
    }




}
