package dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DbConn;

public class DashBoardReserveDAO {
	private static DashBoardReserveDAO dbdiDAO;
	
	private DashBoardReserveDAO() {
		
	}
	
	public static DashBoardReserveDAO getInstance() {
		
		if(dbdiDAO==null) {
			dbdiDAO = new DashBoardReserveDAO();
		}
		
		return dbdiDAO;		
		
	}
	
	public int selectTodayTicket() throws SQLException{
		
		int totalDailyInquiry=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "select count(*) cnt from pay where pay_date= to_char(sysdate,'yyyy-mm-dd') and pay_type=1	";
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
						
			if(rs.next()) {
				totalDailyInquiry=rs.getInt("cnt");
			}
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return totalDailyInquiry;
	}
	
	public int selectTodayRefundTicket() throws SQLException{
		
		int totalDailyInquiry=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "select count(*) cnt from pay where pay_date= to_char(sysdate,'yyyy-mm-dd') and pay_type=1 and refund_state='Y'	";
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totalDailyInquiry=rs.getInt("cnt");
			}
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return totalDailyInquiry;
	}
	public int selectTodayPerf() throws SQLException{
		
		int totalDailyInquiry=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "select count(*) cnt from pay where pay_date= to_char(sysdate,'yyyy-mm-dd') and pay_type=2	";
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totalDailyInquiry=rs.getInt("cnt");
			}
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return totalDailyInquiry;
	}
	
	public int selectTodayRefundPerf() throws SQLException{
		
		int totalDailyInquiry=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "select count(*) cnt from pay where pay_date= to_char(sysdate,'yyyy-mm-dd') and pay_type=2 and refund_state='Y'	";
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				totalDailyInquiry=rs.getInt("cnt");
			}
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return totalDailyInquiry;
	}
	
	
	
}
