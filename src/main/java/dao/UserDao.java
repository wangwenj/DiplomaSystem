/**
 * 2018/1/5 17：33
 * wwc
 */

package dao;

import java.util.List;

import entity.UserEntity;
import entity.postmailEntity;

public interface UserDao {
	boolean login(String name,String password);

	boolean registration(String name,String password1,String password2, String mail);

	boolean replacepassword(String name,String password1,String password2,String password3);

	boolean edit(String username,String qq,String address,String mail,String tel,String introduce,String gender);

	boolean postmail(postmailEntity info, String title);

	UserEntity getOne(String name);

    List<UserEntity> getAll();
	int Mycollectcount(int id_user);

    int orgManager(int id);
    int projectNumberNow(int id);
	int projectNumberHistory(int id);
}
