package dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class DashBoardDailyUserDAO {
	private static DashBoardDailyUserDAO dbduDAO;
	
	private DashBoardDailyUserDAO() {
		
	}
	
	public static DashBoardDailyUserDAO getInstance() {
		
		if(dbduDAO==null) {
			dbduDAO = new DashBoardDailyUserDAO();
		}
		
		return dbduDAO;		
		
	}
	
	public List<DashBoardDailyUserDTO> searchTotalUser() throws SQLException{
		List<DashBoardDailyUserDTO> list = new ArrayList<DashBoardDailyUserDTO>();
		
		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = 
					"SELECT	"
					+ "    M.month_year AS analysis_month,	"
					+ "    COALESCE(A.count_annual_visitors, 0) AS count_annual_visitors, 	"
					+ "    COALESCE(N.count_normal_visitors, 0) AS count_normal_visitors  	"
					+ "	FROM	"
					+ "    ( 	"
					+ "    SELECT	"
					+ "        TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1 - LEVEL), 'YYYY-MM') AS month_year	"
					+ "    FROM DUAL	"
					+ "    CONNECT BY LEVEL <= 6	"
					+ "    ) M	"
					+ "LEFT JOIN	"
					+ "    ( 	"
					+ "    SELECT	"
					+ "        TO_CHAR(TRUNC(A.use_final_date, 'MM'), 'YYYY-MM') AS month_year,	"
					+ "        SUM(P.personal_cnt) AS count_annual_visitors	"
					+ "    FROM ann_ticket A	"
					+ "    JOIN personal P ON A.t_res_num = P.t_res_num	"
					+ "    WHERE	"
					+ "        A.use_final_date >= TRUNC(ADD_MONTHS(SYSDATE, -5), 'MM')	"
					+ "        AND A.use_final_date < TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM')	"
					+ "        AND A.ann_is_use = 'Y'	"
					+ "    GROUP BY TO_CHAR(TRUNC(A.use_final_date, 'MM'), 'YYYY-MM')	"
					+ "    ) A ON M.month_year = A.month_year	"
					+ "LEFT JOIN	"
					+ "    (	"
					+ "    SELECT	"
					+ "        TO_CHAR(TRUNC(N.use_date, 'MM'), 'YYYY-MM') AS month_year,	"
					+ "        SUM(P.personal_cnt) AS count_normal_visitors	"
					+ "    FROM normal_ticket N	"
					+ "    JOIN personal P ON N.t_res_num = P.t_res_num	"
					+ "    WHERE	"
					+ "        N.use_date >= TRUNC(ADD_MONTHS(SYSDATE, -5), 'MM')	"
					+ "        AND N.use_date < TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM')	"
					+ "        AND N.normal_is_use = 'Y'	"
					+ "    GROUP BY TO_CHAR(TRUNC(N.use_date, 'MM'), 'YYYY-MM')	"
					+ "    ) N ON M.month_year = N.month_year	"
					+ "	ORDER BY	"
					+ "    analysis_month";
			
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				DashBoardDailyUserDTO dbduDTO = new DashBoardDailyUserDTO();
				dbduDTO.setDate(rs.getString("analysis_month"));
				dbduDTO.setAnnUser(rs.getInt("count_annual_visitors"));
				dbduDTO.setNormalUser(rs.getInt("count_normal_visitors"));
				System.out.println(dbduDTO);
				list.add(dbduDTO);
			}
		
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	
	public int searchTodayUser() throws SQLException{
		
		int totalDailyUser=0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = "SELECT "
					+ "    COALESCE(SUM(today_visitors), 0) AS total_visitors	"
					+ "	FROM (		"
					+ "    SELECT	"
					+ "        P.personal_cnt AS today_visitors	"
					+ "    FROM normal_ticket N	"
					+ "    JOIN personal P ON N.t_res_num = P.t_res_num	"
					+ "    WHERE TRUNC(N.use_date) = TRUNC(SYSDATE) "
					+ "    UNION ALL	"
					+ "    SELECT	"
					+ "        P.personal_cnt AS today_visitors	"
					+ "    FROM ann_ticket A	"
					+ "    JOIN personal P ON A.t_res_num = P.t_res_num 	"
					+ "    WHERE TRUNC(A.use_final_date) = TRUNC(SYSDATE) 	"
					+ ")	";
			
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
			
			
			if(rs.next()) {
				totalDailyUser=rs.getInt("total_visitors");
				System.out.println(totalDailyUser);
			}						
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return totalDailyUser;
	}
	
	
	
}
