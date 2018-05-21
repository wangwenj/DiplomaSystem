package daoImp;

import dao.DAO;
import dao.NoticeDao;
import entity.Notice;

import java.util.List;

public class NoticeDaoImpl extends DAO<Notice> implements NoticeDao{

    @Override
    public int submitNotice(int id_user, String content, String time_submit, String title,String status) {
        String sql="insert into announcement (id_user,content,time_submit,title,status) values (?,?,?,?,?)";
        return update(sql,id_user,content,time_submit,title,status);
    }

    @Override
    public List<Notice> getAll(String status) {
        String sql="select id_announcement,name as write_name,time_submit,title,content,status from announcement inner join user on user.id_user=announcement.id_user where status=?";
        return getForList(sql,status);
    }

    @Override
    public Notice getDetails(int id) {
        String sql="select * from announcement where id_announcement=?";
        return get(sql,id);
    }

    @Override
    public int dealNotice(int id_announcement,int id_admin,String time_approval,String status){
        String sql="update announcement set id_admin=?,time_approval=?,status=? where id_announcement=?";
        return update(sql,id_admin,time_approval,status,id_announcement);
    }
}
