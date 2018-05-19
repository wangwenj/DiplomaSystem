package daoImp;

import dao.DAO;
import dao.DepartmentDao;
import entity.Department;

import java.util.List;

public class DepartmentImp extends DAO<Department> implements DepartmentDao {
    @Override
    public List<Department> getAllDepartment() {
        String sql = "select * from department";
        return getForList(sql);
    }

    @Override
    public int addDepart(String name, int id, String intro, String address, String tel) {
        String sql = "insert into department (d_name,id_department,intro,address,tel) values (?,?,?,?,?)";
        return update(sql,name, id, intro, address, tel);
    }

    @Override
    public int updateDepart(String name,  String intro, String address, String tel,int id) {
        String sql = "update department set d_name=?,intro=?,address=?,tel=?where id_department=?";
        return update(sql,name,  intro, address, tel,id);
    }

    @Override
    public Department checkRepeatD_Name(String name) {
        String sql="select * from department where d_name=?";
        return get(sql,name);
    }

    @Override
    public Department checkRepeatD_Id(int id) {
        String sql="select * from department where id_department=?";
        return get(sql,id);
    }

    @Override
    public String findD_name(int id) {
        String sql="select d_name from department where id_department=?";
        return getForValue(sql,id);
    }

    @Override
    public void deleteDepart(int id) {
        String sql="delete from department where id_department=?";
        update(sql,id);
    }


}
