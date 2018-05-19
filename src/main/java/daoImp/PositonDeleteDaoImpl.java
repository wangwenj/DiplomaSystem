package daoImp;

import dao.DAO;
import dao.PositionDeleteDao;
import entity.PositionDelete;

import java.util.List;

public class PositonDeleteDaoImpl extends DAO<PositionDelete> implements PositionDeleteDao{
    @Override
    public int add_position_delete(int id_position, String p_name, String intro, String delete_time_position) {
        String sql="insert into dustbin_position (id_position,p_name,intro,delete_time_position) values (?,?,?,?)";
        return update(sql,id_position,p_name,intro,delete_time_position);
    }

    @Override
    public void delete_position_delete(int id_position) {
        String sql="delete from dustbin_position where id_position=?";
        update(sql,id_position);
    }

    @Override
    public List<PositionDelete> getAll() {
        String sql="select * from dustbin_position";
        return getForList(sql);
    }

    @Override
    public PositionDelete getOne(int id_position) {
        String sql="select * from dustbin_position where id_position=?";
        return get(sql,id_position);
    }
}
