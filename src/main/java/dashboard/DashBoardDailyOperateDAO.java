package dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class DashBoardDailyOperateDAO {
	private static DashBoardDailyOperateDAO dbdiDAO;
	
	private DashBoardDailyOperateDAO() {
		
	}
	
	public static DashBoardDailyOperateDAO getInstance() {
		
		if(dbdiDAO==null) {
			dbdiDAO = new DashBoardDailyOperateDAO();
		}
		
		return dbdiDAO;		
		
	}
	
	public int selectTodayOnOperate() throws SQLException{
		
		int onOperate=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "select count(*) cnt from operate right join attraction on attraction.attrac_num = operate.attrac_num where operate_date=to_char(sysdate,'yyyy-mm-dd') and operate_state='Y' ";
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
						
			if(rs.next()) {
				onOperate=rs.getInt("cnt");
			}
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return onOperate;
	}
	public int selectTodayOffOperate() throws SQLException{
		
		int offOperate=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "select count(*) cnt from operate right join attraction on attraction.attrac_num = operate.attrac_num where operate_date=to_char(sysdate,'yyyy-mm-dd') and operate_state='N' ";
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
						
			if(rs.next()) {
				offOperate=rs.getInt("cnt");
			}
			
			
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return offOperate;
	}
	
	
}
