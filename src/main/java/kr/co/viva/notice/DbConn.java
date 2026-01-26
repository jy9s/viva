package kr.co.viva.notice;

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
	 * 
	 * @param jndiName
	 * @return
	 */
	public static DbConn getInstance(String jndiName) {
		if (dbCon == null) {
			dbCon = new DbConn();
			dbCon.jndiName = jndiName;
		} // end if
		return dbCon;
	}// getInstance

	/**
	 * DBCP에서 Connection 얻기
	 * 
	 * @return
	 */
	public Connection getConn() {
		// 1.
		Connection con = null;
		// 1.JNDI 사용 객체 생성
		try {
			Context ctx = new InitialContext();
			// 2.DBCP에 DataSource얻기
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/" + jndiName);
			// 3.DataSource로 부터 Connection 얻기
			con = ds.getConnection();
		} catch (NamingException ne) {
			ne.printStackTrace();
		} catch (SQLException se) {
			se.printStackTrace();
		} // end catch

		return con;
	}// getConn

	public void dbClose(ResultSet rs, Statement stmt, Connection con) throws SQLException {
		try {
			if (rs != null) {
				rs.close();
			} // end if
			if (stmt != null) {
				stmt.close();
			} // end if
		} finally {
			if (con != null) {
				con.close();
			} // end if
		} // end finally
	}// dbClose
}
