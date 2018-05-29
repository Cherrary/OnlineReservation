package test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import utils.DaoFactory;

public class DaoFactoryTest {

	@Before
	public void setUp() throws Exception {
	}

	@Test
	public void testGetDaoFactory() {
		assertNotNull(DaoFactory.getDaoFactory());
	}

	@Test
	public void testNewInstance() {
		assertNotNull(DaoFactory.getDaoFactory().newInstance("userdao"));
	}

}
