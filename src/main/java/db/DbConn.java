package db;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class DbConn {
	
	private static DbConn dbCon;
	private String jndiName;
	
	private DbConn() {
	
	}
	
	/**
	 * 객체를 얻을 때 JNDI 설정
	 * @param jndiName
	 * @return
	 */
	public static DbConn getInstance(String jndiName) {
		
		if(dbCon==null) {
			dbCon = new DbConn();
			dbCon.jndiName = jndiName;
		}
		
		return dbCon;
	}
	
	/**
	 * DBCP에서 Connection 얻기
	 * @return
	 * @throws SQLException 
	 */
	public Connection getConn() throws SQLException{
		Connection con=null;
		//1. JNDI 사용객체를 생성
		try {
		Context ctx = new InitialContext();
		//2. DBCP에서 DateSource를 얻기
		DataSource ds = (DataSource)ctx.lookup("java:comp/env/"+jndiName);
		//3. DataSorce에서 Connection 얻기
		
		con=ds.getConnection();
		
		}catch(NamingException ne){
			ne.printStackTrace();
		}
		return con;
	}
	
	public void dbClose(ResultSet rs, Statement stmt, Connection con) throws SQLException {
		try {
			if(rs!=null) {rs.close();}
			if(stmt!=null) {stmt.close();}
		}finally {
			if(con!=null) {con.close();}
		}		
	}
	

}
