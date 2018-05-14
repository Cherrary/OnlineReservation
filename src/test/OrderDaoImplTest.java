package test;

import static org.junit.Assert.*;

import java.sql.Timestamp;

import org.junit.Before;
import org.junit.Test;

import bean.Order;
import dao.IOrderDao;
import dao.OrderDaoImpl;

public class OrderDaoImplTest {

	IOrderDao orderdao = null;
	@Before
	public void setUp() throws Exception {
		orderdao = new OrderDaoImpl();
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
		Order order = new Order();
		order.setOruserid(1);
		order.setOrlinkman("С��");
		order.setOraddress("�����к������й����ʴ�ѧ��������");
		order.setOrphone(1223455678);
		order.setOrdate(Timestamp.valueOf("2018-05-12 18:51:43.124"));
		order.setOrprice(23);
		order.setOrdiid("124");
		order.setOrdescribe("������");
		assertEquals(1, orderdao.InsertUser(order));
		
	}

	@Test
	public void testUpdateUser() {
		Order order = new Order();
		order.setOrid(1);
		order.setOrdescribe("����");
		assertEquals(1, orderdao.UpdateUser(order));
	}

	@Test
	public void testDeleteUser() {
		Order order = new Order();
		order.setOrid(2);
		assertEquals(1, orderdao.DeleteUser(order));
	}
}
