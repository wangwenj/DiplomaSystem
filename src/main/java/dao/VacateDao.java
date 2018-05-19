package dao;


import entity.User;
import entity.Vacate;

import javax.print.DocFlavor;
import java.util.List;

public interface VacateDao {
    Vacate getApplyInfo(String name);

    Vacate getAdminInfo(String name);

    int add(int apply_name_id, String time_apply, String time_start, String time_end, int admin_user_id, String total_time, String reason_input, String status);

    List<Vacate> getAllVacate(int id); //根据登录用户(管理员)查出所有未审核的请假单（查出需要审核的请假单）

    List<Vacate> getAllApply(int id);//根据登录用户（所有用户）查出请假单（用户查看自己的申请过的申请单）

    Vacate getVacateForm(int id);

    int updateToPermit(int id);

    int updateToNotPermit(int id);

}
