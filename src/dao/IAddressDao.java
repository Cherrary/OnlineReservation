package dao;

import java.util.ArrayList;

import bean.Address;;

public interface IAddressDao {
	/**
	 * find all users in db
	 * @return
	 */
	public ArrayList<Address> findUserAll();
	
	/**
	 * find user through id in db
	 * @param id 
	 * @return
	 */
	public Address findUserById(int id);
	
	/**
	 * find user by any other params and sql
	 * @param sql
	 * @param params
	 * @return
	 */
	public ArrayList<Address> findUserBy(String sql,Object[] params);//params表示参数
	
	/**
	 * insert user into db
	 * @param student
	 * @return
	 */
	public int InsertUser(Address order);
	
	/**
	 * update user in db
	 * @param student
	 * @return
	 */
	public int UpdateUser(Address order);
	
	/**
	 * delete user in db
	 * @param student
	 * @return
	 */
	public int DeleteUser(Address order);
}
