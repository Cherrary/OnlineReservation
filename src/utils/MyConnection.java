package utils;

import java.sql.Array;
import java.sql.Blob;
import java.sql.CallableStatement;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.DatabaseMetaData;
import java.sql.NClob;
import java.sql.PreparedStatement;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.sql.SQLWarning;
import java.sql.SQLXML;
import java.sql.Savepoint;
import java.sql.Statement;
import java.sql.Struct;
import java.util.LinkedList;
import java.util.Map;
import java.util.Properties;
import java.util.concurrent.Executor;

public class MyConnection implements Connection{
	private Connection realconn;
	private LinkedList connPool;

	public MyConnection(Connection rconn,LinkedList cPool) {
		this.realconn = rconn;
		this.connPool = cPool;
	}
	@Override
	public <T> T unwrap(Class<T> iface) throws SQLException {
		return realconn.unwrap(iface);
	}

	@Override
	public boolean isWrapperFor(Class<?> iface) throws SQLException {
		return realconn.isWrapperFor(iface);
	}

	@Override
	public Statement createStatement() throws SQLException {
		return realconn.createStatement();
	}

	@Override
	public PreparedStatement prepareStatement(String sql) throws SQLException {
		return realconn.prepareStatement(sql);
	}

	@Override
	public CallableStatement prepareCall(String sql) throws SQLException {
		return prepareCall(sql);
	}

	@Override
	public String nativeSQL(String sql) throws SQLException {
		return realconn.nativeSQL(sql);
	}

	@Override
	public void setAutoCommit(boolean autoCommit) throws SQLException {
		realconn.setAutoCommit(autoCommit);
	}

	@Override
	public boolean getAutoCommit() throws SQLException {
		return realconn.getAutoCommit();
	}

	@Override
	public void commit() throws SQLException {
		realconn.commit();
		
	}

	@Override
	public void rollback() throws SQLException {
		realconn.rollback();
		
	}

	@Override
	public void close() throws SQLException {
		this.connPool.addLast(this);
		
	}

	@Override
	public boolean isClosed() throws SQLException {
		return realconn.isClosed();
	}

	@Override
	public DatabaseMetaData getMetaData() throws SQLException {
		return realconn.getMetaData();
	}

	@Override
	public void setReadOnly(boolean readOnly) throws SQLException {
		realconn.setReadOnly(readOnly);
		
	}

	@Override
	public boolean isReadOnly() throws SQLException {
		return realconn.isReadOnly();
	}

	@Override
	public void setCatalog(String catalog) throws SQLException {
		realconn.setCatalog(catalog);
		
	}

	@Override
	public String getCatalog() throws SQLException {
		return realconn.getCatalog();
	}

	@Override
	public void setTransactionIsolation(int level) throws SQLException {
		realconn.setTransactionIsolation(level);
		
	}

	@Override
	public int getTransactionIsolation() throws SQLException {
		return realconn.getTransactionIsolation();
	}

	@Override
	public SQLWarning getWarnings() throws SQLException {
		return realconn.getWarnings();
	}

	@Override
	public void clearWarnings() throws SQLException {
		realconn.clearWarnings();
		
	}

	@Override
	public Statement createStatement(int resultSetType, int resultSetConcurrency) throws SQLException {
		return realconn.createStatement(resultSetType, resultSetConcurrency);
	}

	@Override
	public PreparedStatement prepareStatement(String sql, int resultSetType, int resultSetConcurrency)
			throws SQLException {
		return realconn.prepareStatement(sql, resultSetType, resultSetConcurrency);
	}

	@Override
	public CallableStatement prepareCall(String sql, int resultSetType, int resultSetConcurrency) throws SQLException {
		return realconn.prepareCall(sql, resultSetType, resultSetConcurrency);
	}

	@Override
	public Map<String, Class<?>> getTypeMap() throws SQLException {
		return realconn.getTypeMap();
	}

	@Override
	public void setTypeMap(Map<String, Class<?>> map) throws SQLException {
		realconn.setTypeMap(map);
		
	}

	@Override
	public void setHoldability(int holdability) throws SQLException {
		realconn.setHoldability(holdability);
		
	}

	@Override
	public int getHoldability() throws SQLException {
		return realconn.getHoldability();
	}

	@Override
	public Savepoint setSavepoint() throws SQLException {
		return realconn.setSavepoint();
	}

	@Override
	public Savepoint setSavepoint(String name) throws SQLException {
		return realconn.setSavepoint(name);
	}

	@Override
	public void rollback(Savepoint savepoint) throws SQLException {
		realconn.rollback(savepoint);
		
	}

	@Override
	public void releaseSavepoint(Savepoint savepoint) throws SQLException {
		realconn.releaseSavepoint(savepoint);
		
	}

	@Override
	public Statement createStatement(int resultSetType, int resultSetConcurrency, int resultSetHoldability)
			throws SQLException {
		return realconn.createStatement(resultSetType, resultSetConcurrency, resultSetHoldability);
	}

	@Override
	public PreparedStatement prepareStatement(String sql, int resultSetType, int resultSetConcurrency,
			int resultSetHoldability) throws SQLException {
		return realconn.prepareStatement(sql, resultSetType, resultSetConcurrency, resultSetHoldability);
	}

	@Override
	public CallableStatement prepareCall(String sql, int resultSetType, int resultSetConcurrency,
			int resultSetHoldability) throws SQLException {
		return realconn.prepareCall(sql, resultSetType, resultSetConcurrency, resultSetHoldability);
	}

	@Override
	public PreparedStatement prepareStatement(String sql, int autoGeneratedKeys) throws SQLException {
		return realconn.prepareStatement(sql, autoGeneratedKeys);
	}

	@Override
	public PreparedStatement prepareStatement(String sql, int[] columnIndexes) throws SQLException {
		return realconn.prepareStatement(sql, columnIndexes);
	}

	@Override
	public PreparedStatement prepareStatement(String sql, String[] columnNames) throws SQLException {
		return realconn.prepareStatement(sql, columnNames);
	}

	@Override
	public Clob createClob() throws SQLException {
		return realconn.createClob();
	}

	@Override
	public Blob createBlob() throws SQLException {
		return realconn.createBlob();
	}

	@Override
	public NClob createNClob() throws SQLException {
		return realconn.createNClob();
	}

	@Override
	public SQLXML createSQLXML() throws SQLException {
		return realconn.createSQLXML();
	}

	@Override
	public boolean isValid(int timeout) throws SQLException {
		return realconn.getAutoCommit();
	}

	@Override
	public void setClientInfo(String name, String value) throws SQLClientInfoException {
		realconn.setClientInfo(name, value);
		
	}

	@Override
	public void setClientInfo(Properties properties) throws SQLClientInfoException {
		realconn.setClientInfo(properties);
		
	}

	@Override
	public String getClientInfo(String name) throws SQLException {
		return realconn.getClientInfo(name);
	}

	@Override
	public Properties getClientInfo() throws SQLException {
		return realconn.getClientInfo();
	}

	@Override
	public Array createArrayOf(String typeName, Object[] elements) throws SQLException {
		return realconn.createArrayOf(typeName, elements);
	}

	@Override
	public Struct createStruct(String typeName, Object[] attributes) throws SQLException {
		return realconn.createStruct(typeName, attributes);
	}

	@Override
	public void setSchema(String schema) throws SQLException {
		realconn.setSchema(schema);
		
	}

	@Override
	public String getSchema() throws SQLException {
		return realconn.getSchema();
	}

	@Override
	public void abort(Executor executor) throws SQLException {
		realconn.abort(executor);
		
	}

	@Override
	public void setNetworkTimeout(Executor executor, int milliseconds) throws SQLException {
		realconn.setNetworkTimeout(executor, milliseconds);
		
	}

	@Override
	public int getNetworkTimeout() throws SQLException {
		return realconn.getNetworkTimeout();
	}

}
