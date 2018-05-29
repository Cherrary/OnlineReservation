package dao;

import java.lang.reflect.Method;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.Statement;
import java.util.ArrayList;

import utils.JDBCUtils;

public class baseDao {

	public ArrayList findObjAll(String sql,Class clazz){
		Connection conn =null;
		Statement st=null;
		ResultSet rs=null;
		ArrayList<Object> objlist = new ArrayList<Object>();
		try{		
			conn=JDBCUtils.getJDBCUtils().getConnection();
	        st=conn.createStatement();
			rs=st.executeQuery(sql);
			while(rs.next()){
				objlist.add(mappingObj(rs, clazz));
			}
			return objlist;
		}catch(Exception e){e.printStackTrace();return null;}
		finally{
			JDBCUtils.getJDBCUtils().free(rs, st, conn);
		}
		
	}

	public Object findObjById(String sql,int id,Class clazz){
		Connection conn =null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		Object obj=null;
		try{		
			conn=JDBCUtils.getJDBCUtils().getConnection();
			ps= conn.prepareStatement(sql);
			ps.setInt(1,id);
			rs=ps.executeQuery();
			while(rs.next()){
				obj = mappingObj(rs, clazz);
			}
			return obj;
		}catch(Exception e){e.printStackTrace();return null; }
		finally{
			JDBCUtils.getJDBCUtils().free(rs, ps, conn);
		}
	}
	
	public ArrayList findObjBy(String sql, Object[] params,Class clazz){
		Connection conn =null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		ArrayList<Object> objlist = new ArrayList<Object>();
		try{		
			conn=JDBCUtils.getJDBCUtils().getConnection();
			ps= conn.prepareStatement(sql);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			rs=ps.executeQuery();
			while(rs.next()){
				objlist.add(mappingObj(rs, clazz));
			}
			return objlist;
		}catch(Exception e){e.printStackTrace();return null; }
		finally{
			JDBCUtils.getJDBCUtils().free(null, ps, conn);
		}
	}

	public int modifyObj(String sqlin,Object[] params){
		Connection conn =null;
		PreparedStatement ps=null;
		try{		
			conn=JDBCUtils.getJDBCUtils().getConnection();
			ps= conn.prepareStatement(sqlin);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			int i=ps.executeUpdate();
			conn.commit();
			System.out.println("Insert: "+i);
			return i;
		}catch(Exception e){e.printStackTrace();return 0;}
		finally{
			JDBCUtils.getJDBCUtils().free(null, ps, conn);
		}
	}
	
	public int UpdateObj(String sqlup,Object[] params) {
		Connection conn =null;
		PreparedStatement ps=null;
		try{		
			conn=JDBCUtils.getJDBCUtils().getConnection();
			ps= conn.prepareStatement(sqlup);
			for(int i=0;i<params.length;i++){
				ps.setObject(i+1, params[i]);
			}
			int i=ps.executeUpdate();
			conn.commit();
			System.out.println("Update: "+i);
			return i;
		}catch(Exception e){e.printStackTrace();return 0;}
		finally{
			JDBCUtils.getJDBCUtils().free(null, ps, conn);
		}
	}

	public int DeleteObj(String sqlde,Object[] params) {
		Connection conn =null;
		PreparedStatement ps=null;
		try{		
			conn=JDBCUtils.getJDBCUtils().getConnection();
			ps= conn.prepareStatement(sqlde);
			ps.setObject(1,params[0]);
			int i=ps.executeUpdate();
			conn.commit();
			System.out.println("Delete: "+i);
			return i;
		}catch(Exception e){e.printStackTrace();return 0;}
		finally{
			JDBCUtils.getJDBCUtils().free(null, ps, conn);
		}
	}

	
	private Object mappingObj(ResultSet rs,Class clazz){
		//ʵ����һ������
		try{
			//ͨ�����佫���������setXxx�����ҵ�;
			Object object = clazz.newInstance();
			Method[] methods = clazz.getMethods(); 
			//ͨ��ResultSetMetaData��ý���������б�����
			ResultSetMetaData rsMetaData = rs.getMetaData();
			for(int i=1;i<rsMetaData.getColumnCount()+1;i++){
				//�����˷�����
				String colname=rsMetaData.getColumnLabel(i);
				char h =colname.charAt(0);
				if(h>='a' && h<='z')
					colname = (char)(h-32)+colname.substring(1);
				colname = "set" + colname ;
				//�ڷ����в��Ҹ÷���
				for(Method method:methods){
					//�ҵ����б�������ƥ�䣨�������е�xxx���б�����ȣ���
					if(method.getName().equals(colname))
						method.invoke(object, rs.getObject(i));//����һ���ҵ��ķ������б�����Ӧ��ϵ���и�ֵ

				}
			}
			return object;
		}catch (Exception e) {
			return  null;
		}
	}
	public int getTotalRecords(String sql){
		int count=0;
		Connection conn =null;
		PreparedStatement ps=null;
		ResultSet rs=null;
		try{		
			conn=JDBCUtils.getJDBCUtils().getConnection();
			ps= conn.prepareStatement(sql);
			rs = ps.executeQuery();
			while(rs.next())
				count=rs.getInt(1);
			return count;
		}catch(Exception e){e.printStackTrace();return 0;}
		finally{
			JDBCUtils.getJDBCUtils().free(null, ps, conn);
		}
	}
}
