package dao;

import java.util.ArrayList;

import bean.User;

public class UserDaoImpl  extends baseDao implements IUserDao{
	@Override
	public ArrayList<User> findUserAll() {
		String sql = String.format("select * from User");
		return this.findObjAll(sql, User.class);
	}

	@Override
	public User findUserById(int id) {
		String sql=String.format("select * from User where Userid=?");
		User user = (User) this.findObjById(sql, id,User.class);
		return user;
	}

	@Override
	public ArrayList<User> findUserBy(String sql, Object[] params) {
		return this.findObjBy(sql, params, User.class);
	}

	@Override
	public int InsertUser(User user) {
		String sqlin=String.format("insert into User values(?,?,?,?)");
		Object []params = {user.getUserid(),user.getUsername(),user.getUserpassword(),user.getUserphone()};
		return this.modifyObj(sqlin, params);
		
	}

	@Override
	public int UpdateUser(User user) {
		String sqlup=String.format("update User set Userpassword=?,Userphone=?, Username=?  where Userid=?");
		Object[] params={user.getUserpassword(),user.getUserphone(),user.getUsername(),user.getUserid()};
		return this.UpdateObj(sqlup, params);
	}

	@Override
	public int DeleteUser(User user) {
		String sqlde=String.format("delete from User  where Userid=?");
		Object[] params={user.getUserid()};
		return this.DeleteObj(sqlde, params);
	}
}
