package dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class DashBoardDailyInquiryDAO {
	private static DashBoardDailyInquiryDAO dbdiDAO;
	
	private DashBoardDailyInquiryDAO() {
		
	}
	
	public static DashBoardDailyInquiryDAO getInstance() {
		
		if(dbdiDAO==null) {
			dbdiDAO = new DashBoardDailyInquiryDAO();
		}
		
		return dbdiDAO;		
		
	}
	
	public int selectTodayInquiry() throws SQLException{
		
		int totalDailyInquiry=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "select count(*) cnt from (select inquiry_num, inquiry_title, CASE WHEN inquiry_return IS NOT NULL THEN 'Y' ELSE 'N' END AS has_return, inquiry_date from inquiry) where inquiry_date= to_char(sysdate,'yyyy-mm-dd')	";
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
	public int selectTodayReply() throws SQLException{
		
		int totalDailyReply=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "select count(*) cnt from (select inquiry_num, inquiry_title, CASE WHEN inquiry_return IS NOT NULL THEN 'Y' ELSE 'N' END AS has_return, inquiry_date from inquiry) where inquiry_date= to_char(sysdate,'yyyy-mm-dd')	and has_return='Y' ";
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
						
			if(rs.next()) {
				totalDailyReply=rs.getInt("cnt");
			}
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return totalDailyReply;
	}
	
	
}
