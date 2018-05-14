package test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import bean.Card;
import dao.CardDaoImpl;
import dao.ICardDao;

public class CardDaoImplTest {

	ICardDao carddao = null;
	@Before
	public void setUp() throws Exception {
		carddao = new CardDaoImpl();
	}

	@Test
	public void testFindUserAll() {
		assertNotNull(carddao.findUserAll());
	}

	@Test
	public void testFindUserById() {
		assertNotNull(carddao.findUserById(1));
	}

	@Test
	public void testFindUserBy() {
		String sql = String.format("select * from Card where Carduserid = ?");
		Object[] params={"1"};
		assertNotNull(carddao.findUserBy(sql, params));
	}

	@Test
	public void testInsertUser() {
		Card card = new Card();
		card.setCarduserid(2);
		card.setCarddiid("124");
		assertEquals(1,carddao.InsertUser(card));
	}

	@Test
	public void testUpdateUser() {
		Card card = new Card();
		card.setCarduserid(2);
		card.setCarddiid("21");
		assertEquals(1, carddao.UpdateUser(card));
	}

	@Test
	public void testDeleteUser() {
		Card card = new Card();
		card.setCarduserid(2);
		assertNotNull(card);
	}

}
