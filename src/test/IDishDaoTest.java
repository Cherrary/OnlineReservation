package test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import bean.Dish;
import dao.DishDaoImpl;
import dao.IDishDao;

public class IDishDaoTest {

	IDishDao dishdao = null;
	@Before
	public void setUp() throws Exception {
		dishdao =new DishDaoImpl();
	}

	@Test
	public void testFindUserAll() {
		assertNotNull(dishdao.findUserAll());
	}

	@Test
	public void testFindUserById() {
		assertNotNull(dishdao.findUserById(1));
	}

	@Test
	public void testFindUserBy() {
		String sql = String.format("select * from Dish where Diid = ?");
		Object[] params={1};
		assertNotNull(dishdao.findUserBy(sql, params));
	}

	@Test
	public void testInsertUser() {
		Dish dish = new Dish();
		dish.setDiname("«‡Ω∑»‚Àø");
		dish.setDiprice(18);
		dish.setDidiscount(0.19);
		dish.setDidescribe("«‡Ω∑¥Ó≈‰»‚Àø");
		dish.setDiimage("E:\\sunset.jpg");
		assertEquals(1, dishdao.InsertUser(dish));
	}

	@Test
	public void testUpdateUser() {
		Dish dish = new Dish();
		dish.setDiid(2);
		dish.setDidiscount(0.99);
		assertEquals(1, dishdao.UpdateUser(dish));
	}

	@Test
	public void testDeleteUser() {
		Dish dish = new Dish();
		dish.setDiid(2);
		assertEquals(1, dishdao.DeleteUser(dish));
	}

}
