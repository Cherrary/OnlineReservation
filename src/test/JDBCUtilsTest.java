package test;

import static org.junit.Assert.*;

import org.junit.Before;
import org.junit.Test;

import utils.JDBCUtils;

public class JDBCUtilsTest {

	@Test
	public void testGetJDBCUtils() {
		assertNotNull(JDBCUtils.getJDBCUtils());
	}

	@Test
	public void testGetConnection() {
		assertNotNull(JDBCUtils.getJDBCUtils().getConnection());
	}



}
