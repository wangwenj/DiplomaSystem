package daoImp;

import dao.DAO;
import dao.VacateDao;
import entity.User;
import entity.Vacate;

import java.util.List;

public class VacateDaoImp extends DAO<Vacate> implements VacateDao{

    @Override
    public Vacate getApplyInfo(String name) {
        String sql="select `POSITION`.P_NAME as apply_posi_name,`DEPARTMENT`.D_NAME as apply_depart_name FROM ((user INNER JOIN `DEPARTMENT` ON `USER`.ID_DEPARTMENT=DEPARTMENT.ID_DEPARTMENT) INNER JOIN `POSITION` ON `POSITION`.`ID_POSITION`=`USER`.ID_POSITION) where `USER`.`NAME`=?";
        Vacate userInfo=(Vacate)get(sql,name);
        return userInfo;
    }

    @Override
    public Vacate getAdminInfo(String name) {
        String sql="select `POSITION`.P_NAME as admin_posi_name  from  user INNER JOIN `POSITION` ON `POSITION`.`ID_POSITION`=`USER`.ID_POSITION  where `USER`.`NAME`=?";
        Vacate adminInfo=(Vacate)get(sql,name);
        return adminInfo;
    }

    @Override
    public int add(int apply_name_id, String time_apply, String time_start, String time_end, int admin_user_id, String reason_input,String total_time,String status) {
        String sql="insert into vacate (id_user,time,time_start,time_end,id_approval,reason,days,status) values (?,?,?,?,?,?,?,?)";
        return update(sql,apply_name_id,time_apply,time_start,time_end,admin_user_id,reason_input,total_time,status);
    }


    @Override
    public List<Vacate> getAllVacate(int id) {
        String sql="select * from(Select a.ID_VACATE,a.REASON,a.time,a.TIME_END,a.TIME_START,a.days,a.id_approval,a.id_user,a.status,\n" +
                "                b.name as apply_name,b.ID_DEPARTMENT as apply_depart_id,b.ID_POSITION as apply_posi_id,c.ID_POSITION as admin_posi_id,c.name as admin_name\n" +
                "                from vacate a\n" +
                "                join user b on a.id_user = b.ID_USER\n" +
                "                join user c on a.id_approval = c.id_user)as d where status='待审批' and id_approval=?";
        return getForList(sql,id);
    }

    @Override
    public List<Vacate> getAllApply(int id) {
        String sql="select * from(Select a.ID_VACATE,a.REASON,a.time,a.TIME_END,a.TIME_START,a.days,a.id_approval,a.id_user,a.status,\n" +
                "                b.name as apply_name,b.ID_DEPARTMENT as apply_depart_id,b.ID_POSITION as apply_posi_id,c.ID_POSITION as admin_posi_id,c.name as admin_name\n" +
                "                from vacate a\n" +
                "                join user b on a.id_user = b.ID_USER\n" +
                "                join user c on a.id_approval = c.id_user)as d where id_user=?";
        return getForList(sql,id);
    }

    @Override
    public Vacate getVacateForm(int id) {
        String sql="select * from(Select a.ID_VACATE,a.REASON,a.time,a.TIME_END,a.TIME_START,a.days,a.id_approval,a.id_user,\n" +
                "                b.name as apply_name,b.ID_DEPARTMENT as apply_depart_id,b.ID_POSITION as apply_posi_id,c.ID_POSITION as admin_posi_id,c.name as admin_name\n" +
                "                from vacate a\n" +
                "                join user b on a.id_user = b.ID_USER\n" +
                "                join user c on a.id_approval = c.id_user)as d where id_vacate=?";
        return get(sql,id);
    }

    @Override
    public int updateToPermit(int id) {
        String sql="update vacate set status='通过' where id_vacate=?";
        return update(sql,id);
    }

    @Override
    public int updateToNotPermit(int id) {
        String sql="update vacate set status='未通过' where id_vacate=?";
        return update(sql,id);
    }


}
