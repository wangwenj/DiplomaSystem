package daoImp;

import dao.DAO;
import dao.UserDao_1;
import entity.UserEntity_1;

/**
 * Created by ${mjy} on 2018/5/6.
 */
public class UserDao1Imp extends DAO<UserEntity_1> implements UserDao_1 {
    @Override
    public UserEntity_1 getOne(String id_user) {
        String sql="select * from USER where id_user=?";
        UserEntity_1 userEntity1 =(UserEntity_1)get(sql,id_user);
        return userEntity1;
    }
}
