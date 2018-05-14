package dao;

import java.util.ArrayList;

import bean.Card;

public interface ICardDao {
	/**
	 * find all users in db
	 * @return
	 */
	public ArrayList<Card> findUserAll();
	
	/**
	 * find user through id in db
	 * @param id 
	 * @return
	 */
	public Card findUserById(int id);
	
	/**
	 * find user by any other params and sql
	 * @param sql
	 * @param params
	 * @return
	 */
	public ArrayList<Card> findUserBy(String sql,Object[] params);//params表示参数
	
	/**
	 * insert user into db
	 * @param student
	 * @return
	 */
	public int InsertUser(Card card);
	
	/**
	 * update user in db
	 * @param student
	 * @return
	 */
	public int UpdateUser(Card card);
	
	/**
	 * delete user in db
	 * @param student
	 * @return
	 */
	public int DeleteUser(Card card);
}
