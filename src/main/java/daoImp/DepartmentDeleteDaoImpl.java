package daoImp;

import dao.DAO;
import dao.DepartmentDeleteDao;
import entity.DepartmentDelete;

import java.util.List;

public class DepartmentDeleteDaoImpl extends DAO<DepartmentDelete> implements DepartmentDeleteDao{
    @Override
    public int add_department_delete(int id_department, String d_name, String intro, String address, String tel, String delete_time_depart) {
        String sql="insert into dustbin_department (id_department,d_name,intro,address,tel,delete_time_depart) values (?,?,?,?,?,?)";
        return update(sql,id_department,d_name,intro,address,tel,delete_time_depart);
    }

    @Override
    public void delete_department_delete(int id_department) {
        String sql="delete from dustbin_department where id_department=?";
        update(sql,id_department);
    }

    @Override
    public List<DepartmentDelete> getAll() {
        String sql="select * from dustbin_department";
        return getForList(sql);
    }

    @Override
    public DepartmentDelete getOne(int id_department) {
        String sql="select * from dustbin_department where id_department=?";
        return get(sql,id_department);
    }
}
