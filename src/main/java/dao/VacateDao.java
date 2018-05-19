package dao;


import entity.User;
import entity.Vacate;

import java.util.List;

public interface VacateDao {
    Vacate getInfo(String name);

    int add(int apply_name_id,String time_apply,String time_start,String time_end,int admin_user_id,String total_time,String reason_input);

   List<Vacate> getAllVacate();
}
