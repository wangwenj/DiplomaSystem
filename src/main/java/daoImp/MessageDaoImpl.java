package daoImp;

import dao.DAO;
import dao.MessageDao;
import entity.Message;

import java.util.List;

public class MessageDaoImpl extends DAO<Message> implements MessageDao{

    @Override
    public List<Message> getAll(String write_name) {
       String sql="select * from message where write_name=?";
       return getForList(sql,write_name);
    }

    @Override
    public int addMessage(String write_content, String write_name, String write_time,String status) {
        String sql="insert into message (write_content,write_name,write_time,status) values (?,?,?,?)";
        return update(sql,write_content,write_name,write_time,status);
    }

    @Override
    public int deleteMessage(int id_message) {
        String sql="delete from message where id_message=?";
        return update(sql,id_message);
    }

    @Override
    public List<Message> manageGetAll(String status) {
        String sql="select * from message where status=?";
        return getForList(sql,status);
    }

    @Override
    public int replyMessage(int id_message, String reply_name, String reply_time, String reply_content,String status) {
        String sql="update message set reply_name=?,reply_time=?,reply_content=?,status=? where id_message=?";
        return update(sql,reply_name,reply_time,reply_content,status,id_message);
    }
}
