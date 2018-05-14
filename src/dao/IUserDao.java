package dao;

import java.util.ArrayList;

import bean.Dish;
import bean.User;

public interface IUserDao {
	/**
	 * find all users in db
	 * @return
	 */
	public ArrayList<User> findUserAll();
	
	/**
	 * find user through id in db
	 * @param id 
	 * @return
	 */
	public User findUserById(int id);
	
	/**
	 * find user by any other params and sql
	 * @param sql
	 * @param params
	 * @return
	 */
	public ArrayList<User> findUserBy(String sql,Object[] params);//params表示参数
	
	/**
	 * insert user into db
	 * @param student
	 * @return
	 */
	public int InsertUser(User user);
	
	/**
	 * update user in db
	 * @param student
	 * @return
	 */
	public int UpdateUser(User user);
	
	/**
	 * delete user in db
	 * @param student
	 * @return
	 */
	public int DeleteUser(User user);
}
