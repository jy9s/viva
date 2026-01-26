package notice;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class AdminNoticeDAO {

private static AdminNoticeDAO nDAO;
	
	private AdminNoticeDAO() {
		
	}
	
	public static AdminNoticeDAO getInstance() {
		
		if(nDAO==null) {
			nDAO = new AdminNoticeDAO();
		}
		
		return nDAO;
	}
	
	public int selectNoticeTotalCnt(AdminNoticeRangeDTO rDTO) throws SQLException {
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
			selectTotal.append("select count(*) cnt from notice where notice_del_flag='N' ");
			//dynamic query : 검색키워드가 있다면 검색 키워드에 해당하는 글의 갯수를 얻기
			if(rDTO.getField()!=null&& !rDTO.getField().isEmpty()) {
				selectTotal.append(" and notice_type=? ");
			}
			
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					selectTotal.append(" and instr(notice_title,?) ! = 0	");
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
	
	
	public List<AdminNoticeDTO> selectRangeNotice(AdminNoticeRangeDTO rDTO) throws SQLException{
		List<AdminNoticeDTO> list = new ArrayList<AdminNoticeDTO>();
		
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
			.append("	select noticenum, adminnum, notice_type, notice_title, notice_msg, notice_views, notice_date from	")
			.append("	(select noticenum, adminnum, notice_type, notice_title, notice_msg, notice_views, notice_date, row_number() over(order by notice_date desc) rnum  from notice where notice_del_flag = 'N'	");
			
			if(rDTO.getField()!=null&& !rDTO.getField().isEmpty()) {
				selectBoard.append(" and notice_type=? ");
			}
			
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				selectBoard.append("  and instr( notice_title,?) ! = 0	");				
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
			
			
			AdminNoticeDTO nDTO = null;
			rs=pstmt.executeQuery();			
			//6. 조회결과 얻기	
			while(rs.next()) {
				nDTO = new AdminNoticeDTO();
				nDTO.setNoticeNum(rs.getInt("noticenum"));
				nDTO.setAdminName("비비");
				if(rs.getInt("adminnum")==1) {
					nDTO.setAdminName("파피");
				}					
				nDTO.setNoticeType(rs.getString("notice_type"));
				nDTO.setNoticeTitle(rs.getString("notice_title"));
				nDTO.setNoticMsg(rs.getString("notice_msg"));
				nDTO.setNoticeViews(rs.getInt("notice_views"));
				nDTO.setNoticeDate(rs.getDate("notice_date"));
				
				list.add(nDTO);
			}
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		
		
		return list;
		
	}
	
	public void insertNotice(AdminNoticeDTO nDTO) throws SQLException {
		
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
			.append("	INSERT INTO notice (noticenum, adminnum, notice_type, notice_title,notice_msg,notice_views,notice_date,notice_del_flag)	")
			.append("	VALUES	 (seq_notice_num.nextval, ?, ?,?,?,0,sysdate,'N') ");
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(insertNotice.toString());
			
			int num=1;
			if(nDTO.getAdminName().equals("비비")) {
				num=2;
			}
			
			pstmt.setInt(1, num);
			pstmt.setString(2, nDTO.getNoticeType());
			pstmt.setString(3, nDTO.getNoticeTitle());
			pstmt.setString(4, nDTO.getNoticMsg());
			
		//6. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
		
	}//insert board
	
	
	public AdminNoticeDTO selectNoticeDetail(int num) throws SQLException {
		AdminNoticeDTO nDTO = null;
		
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
			selectDetail.append("	select noticeNum, notice_type, notice_title, notice_msg, notice_views, notice_date, notice_del_flag")
			.append("	from notice	" )
			.append("	where noticeNum = ?	and notice_del_flag='N' ");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				nDTO= new AdminNoticeDTO();
				nDTO.setNoticeNum(rs.getInt("noticeNum"));
				nDTO.setNoticeType(rs.getString("notice_type"));
				nDTO.setNoticeTitle(rs.getString("notice_title"));
				nDTO.setNoticeDelFlag(rs.getString("notice_del_flag"));
				nDTO.setNoticeViews(rs.getInt("notice_views"));
				nDTO.setNoticeDate(rs.getDate("notice_date"));
					
				//CLOB 처리문
				BufferedReader br = null;
				StringBuilder content = new StringBuilder();
				
				try {
					br = new BufferedReader(rs.getClob("notice_msg").getCharacterStream());
					String readLine="";
					while((readLine=br.readLine())!=null) {
						content.append(readLine);
					}
					if(br != null) {br.close();};
					
				} catch (IOException e) {
					e.printStackTrace();
				} catch (NullPointerException nfe) {
					nfe.printStackTrace();
				}
				nDTO.setNoticMsg(content.toString());
				//CLOB 처리문 끝
				
				
				
				
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return nDTO;
		
	}

	
	/**
	 * 게시글 읽기했을 때 cnt 증가
	 * @param num
	 * @throws SQLException
	 */
	public void updateNoticeCnt(int num) throws SQLException {
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder updateCnt = new StringBuilder();
			updateCnt
			.append("	update notice ")
			.append("	set notice_views = notice_views + 1	" )
			.append("	where noticenum = ?	");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(updateCnt.toString());
			pstmt.setInt(1, num);
		//6. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
	}
	
	
	public int updateNotice(AdminNoticeDTO nDTO) throws SQLException {
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
			.append("	update	notice	")
			.append("	set		notice_type=?, notice_title=?, notice_msg=?	")
			.append("	where	noticenum=?	");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(updateBoard.toString());
			
			
			pstmt.setString(1, nDTO.getNoticeType());
			pstmt.setString(2, nDTO.getNoticeTitle());
			pstmt.setString(3, nDTO.getNoticMsg());
			pstmt.setInt(4, nDTO.getNoticeNum());
			
			
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
			.append("	update	notice	")
			.append("	set		notice_del_flag='Y'	")
			.append("	where	noticeNum=?	");
			
			
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


	