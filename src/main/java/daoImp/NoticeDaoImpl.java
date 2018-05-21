package daoImp;

import dao.DAO;
import dao.NoticeDao;
import entity.Notice;

import java.util.List;

public class NoticeDaoImpl extends DAO<Notice> implements NoticeDao {

    @Override
    public int submitNotice(int id_user, String content, String time_submit, String title, String status) {
        String sql = "insert into announcement (id_user,content,time_submit,title,status) values (?,?,?,?,?)";
        return update(sql, id_user, content, time_submit, title, status);
    }

    //    公告管理的方法
    @Override
    public List<Notice> getAll(String status) {
        String sql="select id_announcement,name as write_name,time_submit,title,content,status from announcement inner join user on user.id_user=announcement.id_user where status=?";
        return getForList(sql, status);
    }

    //    主页使用的方法
    @Override
    public List<Notice> getAllPass(String status) {
        String sql = "select a.id_announcement,b.name as write_name,a.time_submit,a.title,a.content,a.status,a.time_submit,a.time_approval,c.`NAME` as reply_name  \n" +
                "from announcement a\n" +
                " join user b on b.id_user=a.id_user \n" +
                " join user c on c.id_user=a.id_admin\n" +
                " where status=?";
        return getForList(sql, status);
    }


    @Override
    public Notice getDetails(int id) {
        String sql = "select * from announcement where id_announcement=?";
        return get(sql, id);
    }

    @Override
    public int dealNotice(int id_announcement, int id_admin, String time_approval, String status) {
        String sql = "update announcement set id_admin=?,time_approval=?,status=? where id_announcement=?";
        return update(sql, id_admin, time_approval, status, id_announcement);
    }

}
