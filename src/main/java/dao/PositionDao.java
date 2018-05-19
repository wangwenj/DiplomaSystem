package dao;

import entity.Position;

import java.util.List;

public interface PositionDao {
    List<Position> getAllPosition();

    int addPosition(String name, String intro, int id);

    int updatePosition(String name, String intro, int id);

    Position checkRepeatP_Name(String name);

    Position checkRepeatP_Id(int id);

    String findP_name(int id);

    void deletePosition(int id);
}
