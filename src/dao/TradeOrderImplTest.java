package dao;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import bean.Card;
import bean.TradeOrder;

public class TradeOrderImplTest {

	ITradeOrderDao tradeOrderDao = null;
	@Before
	public void setUp() throws Exception {
		tradeOrderDao = new TradeOrderImpl();
	}

	@Test
	public void testFindUserAll() {
		assertNotNull(tradeOrderDao.findUserAll());
	}

	@Test
	public void testFindUserById() {
		assertNotNull(tradeOrderDao.findUserById(1));
	}

	@Test
	public void testFindUserBy() {
		String sql = String.format("select * from TradeOrder where Ordid = ?");
		Object[] params={"1"};
		assertNotNull(tradeOrderDao.findUserBy(sql, params));
	}

	@Test
	public void testInsertUser() {
		TradeOrder tradeOrder = new TradeOrder();
		tradeOrder.setOrduserid(1);
		tradeOrder.setOrddiid("124");
		assertEquals(1,tradeOrderDao.InsertUser(tradeOrder));
	}

	@Test
	public void testUpdateUser() {
		TradeOrder tradeOrder = new TradeOrder();
		tradeOrder.setOrduserid(2);
		tradeOrder.setOrddiid("124");
		assertEquals(1, tradeOrderDao.UpdateUser(tradeOrder));
	}

	@Test
	public void testDeleteUser() {
		TradeOrder tradeOrder = new TradeOrder();
		tradeOrder.setOrduserid(2);
		assertEquals(1,tradeOrderDao.DeleteUser(tradeOrder));
	}

}
