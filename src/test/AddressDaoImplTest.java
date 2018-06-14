package test;

import static org.junit.Assert.*;

import java.sql.Timestamp;

import org.junit.Before;
import org.junit.Test;

import bean.Address;
import dao.AddressDaoImpl;
import dao.IAddressDao;

public class AddressDaoImplTest {

	IAddressDao orderdao = null;
	@Before
	public void setUp() throws Exception {
		orderdao = new AddressDaoImpl();
	}

	@Test
	public void testFindUserAll() {
		assertNotNull(orderdao.findUserAll());
	}

	@Test
	public void testFindUserById() {
		assertNotNull(orderdao.findUserById(1));
	}

	@Test
	public void testFindUserBy() {
		String sql = String.format("select * from OrderItem where Oruserid=?");
		Object[] params = {1};
		assertNotNull(orderdao.findUserBy(sql, params));
	}

	@Test
	public void testInsertUser() {
		Address order = new Address();
		order.setAduserid(1);
		order.setAdlinkman("小明");
		order.setAdaddress("北京市海淀区中国地质大学（北京）");
		order.setAdphone("1223455678");
		assertEquals(1, orderdao.InsertUser(order));
		
	}

	@Test
	public void testUpdateUser() {
		Address order = new Address();
		order.setAdid(1);
		order.setAdaddress("家啦");
		assertEquals(1, orderdao.UpdateUser(order));
	}

	@Test
	public void testDeleteUser() {
		Address order = new Address();
		order.setAdid(2);
		assertEquals(1, orderdao.DeleteUser(order));
	}
}
