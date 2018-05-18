package dao;

import entity.Department;

import java.util.List;

public interface DepartmentDao {
    List<Department> getAllDepartment();

    int addDepart(String name, int id, String intro, String address, String tel);

    int updateDepart(String name, String intro, String address, String tel, int id);

    Department checkRepeatD_Name(String name);

    Department checkRepeatD_Id(int id);

    void deleteDepart(int id);
}
