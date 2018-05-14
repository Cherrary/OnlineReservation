package utils;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.commons.dbcp.BasicDataSourceFactory;


public class JDBCUtils {
	
	private static JDBCUtils jdbcUtils=new JDBCUtils();
	private Properties properties=new Properties();
	private InputStream in=null;
	private DataSource dSource=null;
	private JDBCUtils(){
		in=JDBCUtils.class.getClassLoader().getResourceAsStream("dbcpconfig.property");
		try {
			properties.load(in);
			dSource=BasicDataSourceFactory.createDataSource(properties);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public static JDBCUtils getJDBCUtils(){
		return jdbcUtils;
	}

	public  void setJDBCUtils(JDBCUtils jbs){
		JDBCUtils.jdbcUtils=jbs;
	}

	private Connection getConnection2(){
		try {
			return dSource.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		}
	}
	public Connection getConnection(){
		return getConnection2();
	}
	private  void free2(ResultSet rs,Statement st,Connection conn){
		try{
			if(rs!=null)
				rs.close();
			if(st!=null)
				st.close();
			if(conn!=null)
				conn.close();
		}catch(Exception e){
			e.printStackTrace();
		}
	}
	public void free(ResultSet rs,Statement st,Connection conn){
		free2(rs, st, conn);
	}
}
