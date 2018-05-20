package daoImp;

import dao.DAO;
import dao.SignInOutDao;
import entity.SignInOut;

import java.util.List;


public class SignInOutDaoImpl extends DAO<SignInOut> implements SignInOutDao {

    //添加签到信息
    @Override
    public int add(SignInOut sign) {
        String sql = "INSERT INTO sign_in_out (id, user_id, day_str, sign_time, operation) VALUES (?,?,?,?,?)";
        return update(sql, sign.getId(), sign.getUser_id(), sign.getDay_str(),
                sign.getSign_time(), sign.getOperation());
    }

    @Override
    public SignInOut find(SignInOut sign) {
        String sql = "select * from sign_in_out where user_id=? and day_str=? and operation=?";
        SignInOut signinOut = get(sql, sign.getUser_id(), sign.getDay_str(), sign.getOperation());
        return signinOut;
    }

    @Override
    public int update(int id, String signTime) {
        String sql = "update sign_in_out set sign_time=? where id=?";
        return update(sql, signTime, id);
    }

    @Override
    public void delete(int id) {
        String sql = "delete from sign_in_out where id=?";
        update(sql, id);
    }

    @Override
    public List<SignInOut> getAll() {
        String sql = "select * from user u left join sign_in_out  s  on u.ID_USER=s.user_id";
        return getForList(sql);
    }

    // @Override
    // public int upsert(SigninOut sign) {
    // String sql =
    // "INSERT INTO sign_in_out (id, user_id, day_str, sign_time, operation) VALUES (?,?,?,?,?) ON DUPLICATE KEY UPDATE sign_time=?";
    // return update(sql, sign.getId());
    // }

}
