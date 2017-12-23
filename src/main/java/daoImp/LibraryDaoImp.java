package daoImp;

import dao.DAO;
import dao.LibraryDao;
import entity.LibraryEntity;
import java.util.List;

public class LibraryDaoImp extends DAO<LibraryEntity> implements LibraryDao{

    public LibraryEntity getOne(String name)
    {
        String sql="select * from USER where name=?";
        LibraryEntity library1=get(sql,name);
        return library1;
    }
    public List<LibraryEntity> getAll(int num1,int num2)
    {
        String sql="select * from LIBRARY limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,num1,num2);
        return library1;
    }

    public List<LibraryEntity> getCommon(int num1,int num2)
    {
        String sql="select * from LIBRARY where ID_TEMPLATE=1 limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,num1,num2);
        return library1;
    }

    public List<LibraryEntity> getUser(int num1,int num2)
    {
        String sql="select * from LIBRARY where ID_TEMPLATE=2 limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,num1,num2);
        return library1;
    }

    public List<LibraryEntity> getCase(int num1,int num2)
    {
        String sql="select * from LIBRARY where ID_TEMPLATE=3 limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,num1,num2);
        return library1;
    }

    public List<LibraryEntity> getPicture(int num1,int num2)
    {
        String sql="select * from LIBRARY where ID_TEMPLATE=4 limit ?,? ";
        List<LibraryEntity> library1=getForList(sql,num1,num2);
        return library1;
    }

    public int getAllcount()
    {
        String sql="select count(*) from LIBRARY";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }
    public int getCommoncount()
    {
        String sql="select count(*) from LIBRARY where ID_TEMPLATE=1";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }
    public int getUsercount()
    {
        String sql="select count(*) from LIBRARY where ID_TEMPLATE=2";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }
    public int getCasecount()
    {
        String sql="select count(*) from LIBRARY where ID_TEMPLATE=3";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }
    public int getPicturecount()
    {
        String sql="select count(*) from LIBRARY where ID_TEMPLATE=4";
        int count=Integer.valueOf(getForValue(sql).toString());
        return count;
    }


    public List<LibraryEntity> getMycollect(int id_user,int num1,int num2)
    {
        String sql="SELECT LIBRARY.`NAME`,LIB_COLLECT.ID_LIBRARY,LIBRARY.ID_TEMPLATE,LIBRARY.COLLECT_NUM,LIBRARY.MENTION,LIBRARY.TIME FROM LIB_COLLECT LEFT JOIN LIBRARY ON LIB_COLLECT.ID_LIBRARY = LIBRARY.ID_LIBRARY and LIBRARY.ID_USER=? limit ?,?";
        List<LibraryEntity> librarycollect1=getForList(sql,id_user,num1,num2);
        return librarycollect1;
    }
    public int getAllcount(int id_user)
    {
        String sql="select count(*) from LIB_COLLECT where ID_USER=?";
        int count=Integer.valueOf(getForValue(sql,id_user).toString());
        return count;
    }

}
