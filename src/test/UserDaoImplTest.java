package test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import bean.User;
import dao.IUserDao;
import dao.UserDaoImpl;

public class UserDaoImplTest {

	IUserDao userdao = null;
	@Before
	public void setUp() throws Exception {
		userdao = new UserDaoImpl();
	}

	@Test
	public void testFindUserAll() {
		assertNotNull(userdao.findUserAll());
	}

	@Test
	public void testFindUserById() {
		assertNotNull(userdao.findUserById(1));
	}

	@Test
	public void testFindUserBy() {
		String sql = String.format("select * from User where Userid = ?");
		Object[] params={1};
		assertNotNull(userdao.findUserBy(sql, params));
	}

	@Test
	public void testInsertUser() {
		User user = new User();
		user.setUsername("cherry");
		user.setUserpassword("1234");
		assertEquals(1, userdao.InsertUser(user));
	}

	@Test
	public void testUpdateUser() {
		User user = new User();
		user.setUserpassword("1111");
		user.setUserid(1);
		assertEquals(1, userdao.UpdateUser(user));
	}

	@Test
	public void testDeleteUser() {
		User user = new User();
		user.setUserid(2);
		assertEquals(1, userdao.DeleteUser(user));
	}

}
