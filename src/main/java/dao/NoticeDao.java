package dao;


import entity.Notice;
import entity.Vacate;

import java.util.List;

public interface NoticeDao {
    int submitNotice(int id_user,String content,String time_submit,String title,String status);//提交公告

    List<Notice> getAll(String status);

    Notice getDetails(int id);

    int dealNotice(int id_announcement,int id_admin,String time_approval,String oper);

}
