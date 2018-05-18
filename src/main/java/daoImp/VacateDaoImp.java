package daoImp;

import dao.DAO;
import dao.VacateDao;
import entity.User;
import entity.Vacate;

public class VacateDaoImp extends DAO<Vacate> implements VacateDao{

    @Override
    public Vacate getInfo(String name) {
        String sql="select `POSITION`.P_NAME,`DEPARTMENT`.D_NAME FROM ((user INNER JOIN `DEPARTMENT` ON `USER`.ID_DEPARTMENT=DEPARTMENT.ID_DEPARTMENT) INNER JOIN `POSITION` ON `POSITION`.`ID_POSITION`=`USER`.ID_POSITION) where `USER`.`NAME`=?";
        Vacate userInfo=(Vacate)get(sql,name);
        return userInfo;
    }

    @Override
    public int add(int apply_name_id, String time_apply, String time_start, String time_end, int admin_user_id, String reason_input,String total_time) {
        String sql="insert into vacate (id_user,time,time_start,time_end,id_approval,reason,days) values (?,?,?,?,?,?,?)";
        return update(sql,apply_name_id,time_apply,time_start,time_end,admin_user_id,reason_input,total_time);
    }


}
