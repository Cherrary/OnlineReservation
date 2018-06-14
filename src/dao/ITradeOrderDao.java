package dao;

import java.util.ArrayList;

import bean.TradeOrder;

public interface ITradeOrderDao {
	/**
	 * find all users in db
	 * @return
	 */
	public ArrayList<TradeOrder> findUserAll();
	
	/**
	 * find user through id in db
	 * @param id 
	 * @return
	 */
	public TradeOrder findUserById(int id);
	
	/**
	 * find user by any other params and sql
	 * @param sql
	 * @param params
	 * @return
	 */
	public ArrayList<TradeOrder> findUserBy(String sql,Object[] params);//params表示参数
	
	/**
	 * insert user into db
	 * @param student
	 * @return
	 */
	public int InsertUser(TradeOrder torder);
	
	/**
	 * update user in db
	 * @param student
	 * @return
	 */
	public int UpdateUser(TradeOrder torder);
	
	/**
	 * delete user in db
	 * @param student
	 * @return
	 */
	public int DeleteUser(TradeOrder torder);

	/**
	 * get total dishs
	 * @param sql
	 * @return
	 */
	public int getTotalDishs(String sql);
}
