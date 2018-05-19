package dao;

import entity.DepartmentDelete;

import java.util.List;

public interface DepartmentDeleteDao {
    int add_department_delete(int id_department,String d_name,String intro,String address,String tel,String delete_time_depart);

    void delete_department_delete(int id_department);

    List<DepartmentDelete> getAll();

    DepartmentDelete getOne(int id_department);
}
