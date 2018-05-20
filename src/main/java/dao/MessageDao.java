package dao;

import entity.Message;

import java.util.List;

public interface MessageDao {
    List<Message> getAll(String write_name);

    int addMessage(String write_content,String write_name,String write_time,String status);

    int deleteMessage(int id_message);

    List<Message> manageGetAll(String status);

    int replyMessage(int id_message,String reply_name,String reply_time,String reply_content,String status);
}
