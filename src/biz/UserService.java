package biz;


import java.util.ArrayList;

import bean.User;
import dao.IUserDao;
import utils.DaoFactory;

public class UserService {
	public boolean available(String user,String pwd) {
		IUserDao userDao = (IUserDao)DaoFactory.getDaoFactory().newInstance("userdao");
		String sql = String.format("select * from User where Username=? and Userpassword=?");
		Object []params={user,pwd};
		ArrayList<User> userlist = userDao.findUserBy(sql, params);
		if(userlist.isEmpty())
			return false;
		else return true;
	}
	public int findId(String username){
		IUserDao userDao = (IUserDao)DaoFactory.getDaoFactory().newInstance("userdao");
		String sql = String.format("select * from User where Username=?");
		Object []params={username};
		ArrayList<User> userlist = userDao.findUserBy(sql, params);
		return userlist.get(0).getUserid();
	}
}
