package dao;

import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import org.apache.commons.dbutils.handlers.BeanListHandler;
import org.apache.commons.dbutils.handlers.ScalarHandler;

import util.JdbcUtils;



/**
 * 
 * @author DELL
 *
 * @param <T>
 */
public class DAO<T> {
	
	private QueryRunner qr=new QueryRunner();
	
	private Class<T> clazz;
	
	@SuppressWarnings("unchecked")
	public DAO(){
		Type superClass=getClass().getGenericSuperclass();
		if(superClass instanceof ParameterizedType){
			ParameterizedType parameterizedType=(ParameterizedType)superClass;
			
			Type [] typeArgs=parameterizedType.getActualTypeArguments();
			if(typeArgs !=null && typeArgs.length>0){
				if(typeArgs[0] instanceof Class){
					clazz=(Class<T>)typeArgs[0];
				}
			}
		}
	}
     
	

	@SuppressWarnings("unchecked")
	public <E> E getForValue(String sql,Object ... args){
		Connection connection=null;
		try{
			connection=JdbcUtils.getConnection();
			return (E) qr.query(connection, sql,new ScalarHandler(),args);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			JdbcUtils.releaseConnection(connection);
		}
		return null;
	}

	public <E> E getForValueThrowsExp(String sql,Object ... args) throws SQLException {
		Connection connection=null;

			connection=JdbcUtils.getConnection();
			E res = (E) qr.query(connection, sql,new ScalarHandler(),args);
			JdbcUtils.releaseConnection(connection);
			return res;
	}

	public List<T> getForList(String sql,Object ... args){
		Connection connection=null;
		try{
			connection=JdbcUtils.getConnection();
			return qr.query(connection, sql, new BeanListHandler<>(clazz), args);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			JdbcUtils.releaseConnection(connection);
		}
		return null;
	}
	



	public T get(String sql,Object ... args){
		Connection connection=null;
		try{
			connection=JdbcUtils.getConnection();
			return qr.query(connection, sql,new BeanHandler<>(clazz),args);
		}catch(Exception e){
			e.printStackTrace();
		}
		finally{
			JdbcUtils.releaseConnection(connection);
		}
		return null;

	}



	public int update(String sql, Object ... args){
		Connection connection=null;
		try{
			connection=JdbcUtils.getConnection();
			return qr.update(connection, sql, args);
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			JdbcUtils.releaseConnection(connection);
		}
		return 0;
	}
	public void updateThrowException(String sql, Object ... args) throws SQLException {
		Connection connection=null;
			connection=JdbcUtils.getConnection();
			qr.update(connection, sql, args);
			JdbcUtils.releaseConnection(connection);

	}

//	添加可以获取自增ID的insert方法
	public int insert(String sql,Object ... args) throws SQLException {
        Connection connection=null;

            connection=JdbcUtils.getConnection();
            Long id0 = qr.insert(connection,sql,new ScalarHandler<Long>(),args);
			JdbcUtils.releaseConnection(connection);
            int id = Integer.valueOf(id0.toString());
            return id;
	}

}
