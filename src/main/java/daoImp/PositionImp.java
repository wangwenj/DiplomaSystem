package daoImp;

import dao.DAO;
import dao.PositionDao;
import entity.Position;

import java.util.List;

public class PositionImp extends DAO<Position> implements PositionDao{
    @Override
    public List<Position> getPosition() {
        String sql="select * from position";
        return getForList(sql);
    }
}
