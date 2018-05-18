package daoImp;

import dao.DAO;
import dao.PositionDao;
import entity.Position;

import java.util.List;

public class PositionImp extends DAO<Position> implements PositionDao {
    @Override
    public List<Position> getAllPosition() {
        String sql = "select * from position";
        return getForList(sql);
    }

    @Override
    public int addPosition(String name, String intro, int id) {
        String sql = "insert into position (p_name,intro,id_position) values (?,?,?)";
        return update(sql, name, intro, id);
    }

    @Override
    public int updatePosition(String name, String intro, int id) {
        String sql = "update position set p_name=?,intro=? where id_position=?";
        return update(sql, name, intro, id);
    }

    @Override
    public Position checkRepeatP_Name(String name) {
        String sql = "select * from position where p_name=?";
        return get(sql, name);
    }

    @Override
    public Position checkRepeatP_Id(int id) {
        String sql = "select * from position where id_position=?";
        return get(sql, id);
    }

    @Override
    public void deletePosition(int id) {
        String sql = "delete from position where id_position=?";
        update(sql, id);
    }
}
