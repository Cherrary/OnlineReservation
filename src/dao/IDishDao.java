package dao;

import java.util.ArrayList;

import bean.Dish;

public interface IDishDao {

	/**
	 * find all users in db
	 * @return
	 */
	public ArrayList<Dish> findUserAll();
	
	/**
	 * find user through id in db
	 * @param id 
	 * @return
	 */
	public Dish findUserById(int id);
	
	/**
	 * find user by any other params and sql
	 * @param sql
	 * @param params
	 * @return
	 */
	public ArrayList<Dish>  findUserBy(String sql,Object[] params);//params表示参数
	
	/**
	 * insert user into db
	 * @param student
	 * @return
	 */
	public int InsertUser(Dish dish);
	
	/**
	 * update user in db
	 * @param student
	 * @return
	 */
	public int UpdateUser(Dish dish);
	
	/**
	 * delete user in db
	 * @param student
	 * @return
	 */
	public int DeleteUser(Dish dish);
}
