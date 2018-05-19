package dao;


import entity.Vacate;

import java.util.List;

public interface NoticeDao {
    int submitNotice(String notice_title,String notice_content,int userId_current,String write_date);//提交公告

}
