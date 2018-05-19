package dao;

import entity.PositionDelete;

import java.util.List;

public interface PositionDeleteDao {
    int add_position_delete(int id_position,String p_name,String intro,String delete_time_position);

    void delete_position_delete(int id_position);

    List<PositionDelete> getAll();

    PositionDelete getOne(int id_position);
}
