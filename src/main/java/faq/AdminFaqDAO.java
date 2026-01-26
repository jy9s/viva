package faq;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class AdminFaqDAO {

private static AdminFaqDAO nDAO;
	
	private AdminFaqDAO() {
		
	}
	
	public static AdminFaqDAO getInstance() {
		
		if(nDAO==null) {
			nDAO = new AdminFaqDAO();
		}
		
		return nDAO;
	}
	
	public int selectFaqTotalCnt(AdminFaqRangeDTO rDTO) throws SQLException {
		int totalCnt = 0;
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			//검색 키워드가 없다면 모든 글의 총 갯수를 검색.
			StringBuilder selectTotal = new StringBuilder();
			selectTotal.append("select count(*) cnt from faq where faq_del_flag='N' ");
			//dynamic query : 검색키워드가 있다면 검색 키워드에 해당하는 글의 갯수를 얻기
			if(rDTO.getField()!=null&& !rDTO.getField().isEmpty()) {
				selectTotal.append(" and faq_type=? ");
			}
			
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					selectTotal.append(" and instr(faq_title,?) ! = 0	");
			}//end if
			
			pstmt=con.prepareStatement(selectTotal.toString());			
		//5. 바인드 변수 값 설정
			int pstmtIdx=0;
			if(rDTO.getField()!=null&& !rDTO.getField().isEmpty()) {
				pstmt.setString(++pstmtIdx, rDTO.getFieldStr());	
			}
			
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(++pstmtIdx, rDTO.getKeyword());				
			}
			
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("cnt");
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return totalCnt;
		
	}
	
	
	public List<AdminFaqDTO> selectRangeNotice(AdminFaqRangeDTO rDTO) throws SQLException{
		List<AdminFaqDTO> list = new ArrayList<AdminFaqDTO>();
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1. JNDI 사용객체 생성
			//2. DataSource 얻기
			//3. Connection 얻기
			con = dbCon.getConn();
			//4. 쿼리문생성객체 얻기
			StringBuilder selectBoard = new StringBuilder();
			selectBoard
			.append("	select faq_num, adminnum, faq_type, faq_title, faq_msg, faq_date from	")
			.append("	(select faq_num, adminnum, faq_type, faq_title, faq_msg, faq_date, row_number() over(order by faq_date desc) rnum  from faq where faq_del_flag = 'N'	");
			
			if(rDTO.getField()!=null&& !rDTO.getField().isEmpty()) {
				selectBoard.append(" and faq_type=? ");
			}
			
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				selectBoard.append("  and instr( faq_title,?) ! = 0	");				
			}//end if
			//dynamic query
			selectBoard
			.append("	)	where rnum between ? and ? ");
			
			pstmt = con.prepareStatement(selectBoard.toString());
			//5. 바인드 변수 값 설정
			int pstmtIdx=0;
			if(rDTO.getField()!=null&& !rDTO.getField().isEmpty()) {
				pstmt.setString(++pstmtIdx,rDTO.getFieldStr());
			}			
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(++pstmtIdx, rDTO.getKeyword());
			}//end if
			pstmt.setInt(++pstmtIdx, rDTO.getStartNum());
			pstmt.setInt(++pstmtIdx, rDTO.getEndNum());
			
			
			AdminFaqDTO nDTO = null;
			rs=pstmt.executeQuery();			
			//6. 조회결과 얻기	
			while(rs.next()) {
				nDTO = new AdminFaqDTO();
				nDTO.setFaqNum(rs.getInt("faq_num"));
				nDTO.setAdminName("비비");
				if(rs.getInt("adminnum")==1) {
					nDTO.setAdminName("파피");
				}					
				nDTO.setFaqType(rs.getString("faq_type"));
				nDTO.setFaqTitle(rs.getString("faq_title"));
				nDTO.setFaqMsg(rs.getString("faq_msg"));
				nDTO.setFaqDate(rs.getDate("faq_date"));
				
				list.add(nDTO);
			}
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		
		
		return list;
		
	}
	
	public void insertNotice(AdminFaqDTO nDTO) throws SQLException {
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder insertNotice = new StringBuilder();
			insertNotice
			.append("	INSERT INTO faq (faq_num, adminnum, faq_type, faq_title,faq_msg, faq_date,faq_del_flag)	")
			.append("	VALUES	 (seq_faq_num.nextval, ?, ?,?,?,sysdate,'N') ");
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(insertNotice.toString());
			
			int num=1;
			if(nDTO.getAdminName().equals("비비")) {
				num=2;
			}
			
			pstmt.setInt(1, num);
			pstmt.setString(2, nDTO.getFaqType());
			pstmt.setString(3, nDTO.getFaqTitle());
			pstmt.setString(4, nDTO.getFaqMsg());
			
		//6. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
		
	}//insert board
	
	
	public AdminFaqDTO selectNoticeDetail(int num) throws SQLException {
		AdminFaqDTO nDTO = null;
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder selectDetail = new StringBuilder();
			selectDetail.append("	select faq_num, faq_type, faq_title, faq_msg, faq_date, faq_del_flag")
			.append("	from faq	" )
			.append("	where faq_num = ?	and faq_del_flag='N' ");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nDTO= new AdminFaqDTO();
				nDTO.setFaqNum(rs.getInt("faq_num"));
				nDTO.setFaqType(rs.getString("faq_type"));
				nDTO.setFaqTitle(rs.getString("faq_title"));
				nDTO.setFaqDelFlag(rs.getString("faq_del_flag"));
				nDTO.setFaqMsg(rs.getString("faq_msg"));
				nDTO.setFaqDate(rs.getDate("faq_date"));
				//CLOB 처리문 끝
				
				
				
				
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return nDTO;
		
	}
	
	
	public int updateFaq(AdminFaqDTO nDTO) throws SQLException {
		int cnt = 0;
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder updateBoard = new StringBuilder();
			updateBoard
			.append("	update	faq	")
			.append("	set		faq_type=?, faq_title=?, faq_msg=?	")
			.append("	where	faq_num=?	");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(updateBoard.toString());
			
			
			pstmt.setString(1, nDTO.getFaqType());
			pstmt.setString(2, nDTO.getFaqTitle());
			pstmt.setString(3, nDTO.getFaqMsg());
			pstmt.setInt(4, nDTO.getFaqNum());
			
			
		//6. 쿼리문 수행 후 결과 얻기
			cnt=pstmt.executeUpdate();
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
		return cnt;
	}//update board
	
	public int updateDelFlag(int num) throws SQLException {
		int cnt = 0;
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			//1. JNDI사용객체 생성		
			//2. DataSrouce 얻기			
			//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
			//4. 쿼리문 생성객체 얻기
			StringBuilder deleteBoard = new StringBuilder();
			deleteBoard
			.append("	update	faq	")
			.append("	set		faq_del_flag='Y'	")
			.append("	where	faq_num=?	");
			
			
			//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(deleteBoard.toString());
			
			pstmt.setInt(1, num);
			
			//6. 쿼리문 수행 후 결과 얻기
			cnt=pstmt.executeUpdate();
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
		return cnt;
	}//update board
	
	
	
}


	