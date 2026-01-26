package performance;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class AdminPerformDAO {
	private static AdminPerformDAO pfDAO;
	
	private AdminPerformDAO() {
		
	}
	
	public static AdminPerformDAO getInstance() {
		if(pfDAO==null) {
			pfDAO=new AdminPerformDAO();
		}		
		return pfDAO;
	}
	
	public int selectPerfTotalCnt(AdminPerfRangeDTO prDTO) throws SQLException {
		int totalCnt = 0;
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			con=dbCon.getConn();
			StringBuilder selectTotal = new StringBuilder();
			selectTotal.append("select count(*) cnt from (select perf_num, perf_title from performance where perf_del_flag='N') ");
			if(prDTO.getKeyword()!=null && !prDTO.getKeyword().isEmpty()) {
				selectTotal.append(" where instr(")
				.append(prDTO.getFieldStr()).append(",?) ! = 0");				
			}//end if
			
			pstmt=con.prepareStatement(selectTotal.toString());			
			if(prDTO.getKeyword()!=null && !prDTO.getKeyword().isEmpty()) {
				pstmt.setString(1, prDTO.getKeyword());				
			}
			
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("cnt");
			}//end if
		}finally {
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return totalCnt;
		
	}
	
	public List<AdminPerformDTO> selectPerform(AdminPerfRangeDTO prDTO) throws SQLException{
		List<AdminPerformDTO> list = new ArrayList<AdminPerformDTO>();
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		try {
		con = db.getConn();
		
		StringBuilder selectQuery = new StringBuilder();
		
		selectQuery
		.append(" select perf_num, perf_title, perf_start_date, perf_end_date, perf_input_date from ")
		.append("(select perf_num, perf_title, perf_start_date, perf_end_date, perf_input_date, row_number() over(order by perf_input_date desc) rnum  from performance where perf_del_flag='N'	");
		
		if(prDTO.getKeyword()!=null && !prDTO.getKeyword().isEmpty()) {
			selectQuery.append(" and instr(")
			.append(prDTO.getFieldStr()).append(",?) ! = 0");				
		}//end if
		
		selectQuery.append("	) where rnum between ? and ?");
		
		pstmt=con.prepareStatement(selectQuery.toString());

		int pstmtIdx=0;
		if(prDTO.getKeyword()!=null && !prDTO.getKeyword().isEmpty()) {
			pstmt.setString(++pstmtIdx, prDTO.getKeyword());
		}
		pstmt.setInt(++pstmtIdx, prDTO.getStartNum());
		pstmt.setInt(++pstmtIdx, prDTO.getEndNum());				
		
		rs=pstmt.executeQuery();
		
		while(rs.next()) {
			AdminPerformDTO pDTO = new AdminPerformDTO();
			pDTO.setPerfNum(rs.getInt("perf_num"));
			pDTO.setPerfTitle(rs.getString("perf_title"));
			pDTO.setPerfStartDate(rs.getDate("perf_start_date"));			
			pDTO.setPerfEndDate(rs.getDate("perf_end_date"));
			pDTO.setPerfInputDate(rs.getDate("perf_input_date"));
			
			list.add(pDTO);
		}		
		}finally {
		db.dbClose(rs, pstmt, con);
		}
		return list;
	}
	
	
	public AdminPerformDTO selectDetailPerform(int num) throws SQLException {
		AdminPerformDTO pDTO = new AdminPerformDTO();
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		try {
		con = db.getConn();
		String selectQuery="select perf_title, perf_type, perf_sub_title, "
				+ "perf_start_date, perf_end_date, perf_loc, perf_time, perf_show_time, perf_price, perf_preview, perf_img from performance where perf_del_flag='N' and perf_num=? ";
		
		pstmt=con.prepareStatement(selectQuery);
		pstmt.setInt(1, num);
		rs=pstmt.executeQuery();
		
		
		if(rs.next()) {
			pDTO.setPerfTitle(rs.getString("perf_title"));
			pDTO.setPerfSubTitle(rs.getString("perf_sub_title"));
			pDTO.setPerfType(rs.getInt("perf_type"));
			pDTO.setPerfLoc(rs.getInt("perf_loc"));
			pDTO.setPerfTime(rs.getString("perf_time"));
			pDTO.setPerfShowTime(rs.getInt("perf_show_time"));
			pDTO.setPerfPrice(rs.getInt("perf_price"));
			pDTO.setPerfPreview(rs.getString("perf_preview"));
			pDTO.setPerfImg(rs.getString("perf_img"));
			pDTO.setPerfStartDate(rs.getDate("perf_start_date"));			
			pDTO.setPerfEndDate(rs.getDate("perf_end_date"));
		}		
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return pDTO;
	}
	
	
	public int updatePerform(AdminPerformDTO pDTO) throws SQLException {
		
		int flag = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		try {
		con = db.getConn();
		StringBuilder updatePerf = new StringBuilder();
		updatePerf
		.append(" update performance				")
		.append(" set PERF_TITLE = ? , PERF_SUB_TITLE = ? , PERF_TYPE = ?, PERF_LOC = ?,	")
		.append(" PERF_START_DATE = ? , PERF_END_DATE = ? , PERF_TIME= ? ,	")
		.append(" PERF_SHOW_TIME = ? , PERF_PRICE = ? , PERF_PREVIEW = ? , PERF_IMG = ?	")
		.append("	where PERF_NUM = ?	");
		
		
		pstmt=con.prepareStatement(updatePerf.toString());
		pstmt.setString(1, pDTO.getPerfTitle());
		pstmt.setString(2, pDTO.getPerfSubTitle());
		pstmt.setInt(3, pDTO.getPerfType());
		pstmt.setInt(4, pDTO.getPerfLoc());
		pstmt.setDate(5, pDTO.getPerfStartDate());
		pstmt.setDate(6, pDTO.getPerfEndDate());
		pstmt.setString(7, pDTO.getPerfTime());
		pstmt.setInt(8, pDTO.getPerfShowTime());
		pstmt.setInt(9, pDTO.getPerfPrice());
		pstmt.setString(10, pDTO.getPerfPreview());
		pstmt.setString(11, pDTO.getPerfImg());
		pstmt.setInt(12, pDTO.getPerfNum());		
		
		
		flag=pstmt.executeUpdate();
		
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return flag;
		
	}//updatePerform
	
	public int updateDelPerform(int perfNum) throws SQLException {
		
		int flag = 0;
		
		Connection con = null;
		PreparedStatement pstmt = null;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		try {
		con = db.getConn();
		StringBuilder updatePerf = new StringBuilder();
		updatePerf
		.append(" update performance				")
		.append(" set perf_del_flag = 'Y'           ")
		.append("	where PERF_NUM = ?	");
		
		
		pstmt=con.prepareStatement(updatePerf.toString());
		pstmt.setInt(1, perfNum);
	
		flag=pstmt.executeUpdate();
		
		}finally {
			db.dbClose(null, pstmt, con);
		}
		
		return flag;
		
	}//updatePerform
		
	
	public void insertPerform(AdminPerformDTO pDTO) throws SQLException {
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			String insertBoard="insert into performance values(seq_perf_num.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, 'N' , sysdate ) ";
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(insertBoard);
			pstmt.setString(1, pDTO.getPerfTitle());
			pstmt.setInt(2, pDTO.getPerfType());
			pstmt.setString(3, pDTO.getPerfSubTitle());
			pstmt.setInt(4, pDTO.getPerfLoc());
			pstmt.setDate(5, pDTO.getPerfStartDate());
			pstmt.setDate(6, pDTO.getPerfEndDate());
			pstmt.setString(7, pDTO.getPerfTime());
			pstmt.setInt(8, pDTO.getPerfShowTime());
			pstmt.setInt(9, pDTO.getPerfPrice());
			pstmt.setString(10, pDTO.getPerfPreview());
			pstmt.setString(11, pDTO.getPerfImg());
			
		//6. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
		
	}//insertPerform
	
	
}
