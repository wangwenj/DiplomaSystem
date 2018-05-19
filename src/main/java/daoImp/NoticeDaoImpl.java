package daoImp;

import dao.DAO;
import dao.NoticeDao;
import entity.Notice;

public class NoticeDaoImpl extends DAO<Notice> implements NoticeDao{
    @Override
    public int submitNotice(String notice_title, String notice_content, int userId_current, String write_date) {
        return 0;
    }
}
