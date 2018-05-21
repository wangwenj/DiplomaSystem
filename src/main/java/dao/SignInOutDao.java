package dao;


import entity.SignInOut;

import java.util.List;

public interface SignInOutDao {

    int add(SignInOut sign);

    int update(int id, String signTime);

    void delete(int id);

    SignInOut find(SignInOut sign);

    List<SignInOut> getAll();

    List<SignInOut> getOneWeekSign(String dayFrom, String dayTo);
}
