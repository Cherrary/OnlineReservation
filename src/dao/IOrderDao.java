package dao;

import java.util.ArrayList;

import bean.Order;

public interface IOrderDao {
	/**
	 * find all users in db
	 * @return
	 */
	public ArrayList<Order> findUserAll();
	
	/**
	 * find user through id in db
	 * @param id 
	 * @return
	 */
	public Order findUserById(int id);
	
	/**
	 * find user by any other params and sql
	 * @param sql
	 * @param params
	 * @return
	 */
	public ArrayList<Order> findUserBy(String sql,Object[] params);//params表示参数
	
	/**
	 * insert user into db
	 * @param student
	 * @return
	 */
	public int InsertUser(Order order);
	
	/**
	 * update user in db
	 * @param student
	 * @return
	 */
	public int UpdateUser(Order order);
	
	/**
	 * delete user in db
	 * @param student
	 * @return
	 */
	public int DeleteUser(Order order);
}
