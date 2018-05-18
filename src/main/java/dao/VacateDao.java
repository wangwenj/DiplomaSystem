package dao;


import entity.User;
import entity.Vacate;

public interface VacateDao {
    Vacate getInfo(String name);

    int add(int apply_name_id,String time_apply,String time_start,String time_end,int admin_user_id,String total_time,String reason_input);

   // User getID(String name);
}
