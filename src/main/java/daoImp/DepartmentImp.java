package daoImp;

import dao.DAO;
import dao.DepartmentDao;
import entity.Department;

import java.util.List;

public class DepartmentImp extends DAO<Department> implements DepartmentDao {
    @Override
    public List<Department> getAllDepartment() {
        String sql="select * from department";
        return getForList(sql);
    }
}
