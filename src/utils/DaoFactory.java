package utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

public class DaoFactory {
	private Properties properties;
	private static DaoFactory daoFactory;
	private  DaoFactory() {
		properties = new Properties();
		InputStream inputStream =JDBCUtils.class.getClassLoader().getResourceAsStream("daoconfig.property");
		try {
			properties.load(inputStream);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	public static DaoFactory getDaoFactory(){
		daoFactory = new DaoFactory();
		return daoFactory;
	}
	public Object newInstance(String daoname){
		String dao = properties.getProperty(daoname);
		try {
			Class objDaoImpl = Class.forName(dao);
			return objDaoImpl.newInstance();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		
	}
}
