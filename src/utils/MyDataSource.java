package utils;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.SQLFeatureNotSupportedException;
import java.util.LinkedList;
import java.util.logging.Logger;

import javax.sql.DataSource;

public class MyDataSource implements DataSource {

	private DataSource datasourse;
	private LinkedList connPool=new LinkedList<>();

	public MyDataSource() {
	}
	public MyDataSource(DataSource dataSource) {
		this.datasourse = dataSource;
	}
	
	@Override
	public PrintWriter getLogWriter() throws SQLException {
		return datasourse.getLogWriter();
	}

	@Override
	public void setLogWriter(PrintWriter out) throws SQLException {
		datasourse.setLogWriter(out);
		
	}

	@Override
	public void setLoginTimeout(int seconds) throws SQLException {
		datasourse.setLoginTimeout(seconds);
		
	}

	@Override
	public int getLoginTimeout() throws SQLException {
		return datasourse.getLoginTimeout();
	}

	@Override
	public Logger getParentLogger() throws SQLFeatureNotSupportedException {
		return datasourse.getParentLogger();
	}

	@Override
	public <T> T unwrap(Class<T> iface) throws SQLException {
		return datasourse.unwrap(iface);
	}

	@Override
	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		return datasourse.isWrapperFor(iface);
	}

	@Override
	public Connection getConnection() throws SQLException {
		if(this.connPool.size()>0)
			return (Connection)this.connPool.removeFirst();
		return createConnection();
	}

	private Connection createConnection() {
		Connection realConn = JDBCUtils.getJDBCUtils().getConnection();
		Connection myConnection = new MyConnection(realConn, connPool);
		return myConnection;
	}

	@Override
	public Connection getConnection(String username, String password) throws SQLException {
		return datasourse.getConnection(username, password);
	}

}
