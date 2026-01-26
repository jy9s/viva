package dashboard;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class DashBoardTicketRevenueDAO {
	private static DashBoardTicketRevenueDAO dbtrDAO;
	
	private DashBoardTicketRevenueDAO() {
		
	}
	
	public static DashBoardTicketRevenueDAO getInstance() {
		
		if(dbtrDAO==null) {
			dbtrDAO = new DashBoardTicketRevenueDAO();
		}
		
		return dbtrDAO;		
		
	}
	
	public List<DashBoardTicketRevenueDTO> selectTotalTicket() throws SQLException{
		
		List<DashBoardTicketRevenueDTO> list = new ArrayList<DashBoardTicketRevenueDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
				
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		try {
			con = dbCon.getConn();
			String selectQuery = 
					
					"SELECT "
					+ "    M.month_year AS analysis_month, "
					+ "    COALESCE(P1.total_price, 0) AS ticket_price "
					+ "	FROM "
					+ "    ( SELECT "
					+ "        TO_CHAR(ADD_MONTHS(TRUNC(SYSDATE, 'MM'), 1 - LEVEL), 'YYYY-MM') AS month_year "
					+ "    FROM DUAL "
					+ "    CONNECT BY LEVEL <= 6 "
					+ "    ) M "
					+ "	LEFT JOIN "
					+ "    ( "
					+ "    SELECT "
					+ "        TO_CHAR(TRUNC(pay_date, 'MM'), 'YYYY-MM') AS month_year, "
					+ "        SUM(pay_price) AS total_price "
					+ "    FROM PAY "
					+ "    WHERE "
					+ "        pay_type = 1 "
					+ "        AND pay_date >= TRUNC(ADD_MONTHS(SYSDATE, -5), 'MM') "
					+ "        AND pay_date < TRUNC(ADD_MONTHS(SYSDATE, 1), 'MM') "
					+ "    GROUP BY TO_CHAR(TRUNC(pay_date, 'MM'), 'YYYY-MM') "
					+ "    ) P1 ON M.month_year = P1.month_year "
					+ " ORDER BY "
					+ "    analysis_month ";
			
			pstmt=con.prepareStatement(selectQuery);
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				DashBoardTicketRevenueDTO dbtrDTO = new DashBoardTicketRevenueDTO();
				dbtrDTO.setDate(rs.getString("analysis_month"));
				dbtrDTO.setTicketRev(rs.getInt("ticket_price"));
				
				list.add(dbtrDTO);
				
			}
		
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
}
