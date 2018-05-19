package daoImp;

import dao.DAO;
import dao.UserDeleteDa0;
import entity.UserDelete;

import java.util.List;

public class UserDeleteDaoImpl extends DAO<UserDelete> implements UserDeleteDa0{


    @Override
    public int add_user_delete(int id_user, String password, String name, String gender, int id_department, int id_position, String tel, String address, String intro, String remark, String time,String role) {
        String sql="INSERT INTO dustbin_user (id_user,password,name,gender,id_department,id_position,tel,address,intro,remark,delete_time,role) VALUES (?,?,?,?,?,?,?,?,?,?,?,?)";
        return update(sql,id_user,password,name,gender,id_department,id_position,tel,address,intro,remark,time,role);
    }

    @Override
    public void delete_user_delete(int id_user) {
        String sql="delete from dustbin_user where id_user=?";
        update(sql,id_user);
    }

    @Override
    public List<UserDelete> getAll() {
        String sql="SELECT `dustbin_user`.ID_USER,`dustbin_user`.`NAME`,`dustbin_user`.TEL,`dustbin_user`.INTRO,`dustbin_user`.ADDRESS,`dustbin_user`.REMARK,`dustbin_user`.GENDER,POSITION.ID_POSITION,POSITION.P_NAME,DEPARTMENT.ID_DEPARTMENT,DEPARTMENT.D_NAME,dustbin_user.delete_time,dustbin_user.role FROM ((`dustbin_user`INNER JOIN POSITION ON `dustbin_user`.ID_POSITION=POSITION.ID_POSITION) INNER JOIN DEPARTMENT ON `dustbin_user`.ID_DEPARTMENT=DEPARTMENT.ID_DEPARTMENT)";
        return getForList(sql);
    }

    @Override
    public UserDelete getOne(int id) {
        String sql="select * from dustbin_user where id_user=?";
        return get(sql,id);
    }
}
