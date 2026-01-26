package qna;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class AdminQnaDAO {
private static AdminQnaDAO qDAO;
	
	private AdminQnaDAO() {
		
	}
	
	public static AdminQnaDAO getInstance() {
		if(qDAO==null) {
			qDAO = new AdminQnaDAO();
		}
		return qDAO;
	}
	
	
	public int selectBoardTotalCnt(AdminQnaRangeDTO rDTO) throws SQLException {
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
			selectTotal.append("select count(*) cnt from (select inquiry_num, inquiry_title, id,CASE WHEN inquiry_return IS NOT NULL THEN 'Y' ELSE 'N' END AS has_return, inquiry_date , row_number() over(order by inquiry_date desc) rnum  from inquiry i	left join member m on m.member_num = i.member_num ) ");
			//dynamic query : 검색키워드가 있다면 검색 키워드에 해당하는 글의 갯수를 얻기
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				selectTotal.append(" where instr(")
				.append(rDTO.getFieldStr()).append(",?) != 0");				
			}//end if
			
			pstmt=con.prepareStatement(selectTotal.toString());			
		//5. 바인드 변수 값 설정
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(1, rDTO.getKeyword());				
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
	
	
	public List<AdminQnaDTO> selectRangeBoard(AdminQnaRangeDTO rDTO) throws SQLException{
		List<AdminQnaDTO> list = new ArrayList<AdminQnaDTO>();
		
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
			.append("	SELECT inquiry_num, inquiry_title, id, has_return, inquiry_date from	")
			.append("	(SELECT inquiry_num, inquiry_title, id, has_return, inquiry_date, ROW_NUMBER() OVER (ORDER BY inquiry_date DESC) rnum from	")
			.append("	(SELECT inquiry_num, inquiry_title, id, CASE WHEN inquiry_return IS NOT NULL THEN 'Y' ELSE 'N' END AS has_return, inquiry_date FROM inquiry i	")
			.append("	LEFT JOIN member m ON m.member_num = i.member_num )	");						
			
			//dynamic query : 검색키워드가 있다면 검색 키워드에 해당하는 글의 갯수를 얻기
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				selectBoard.append(" where instr(")
				.append(rDTO.getFieldStr()).append(",?) != 0");				
			}//end if
			//dynamic query
			selectBoard
			.append("	)where rnum between ? and ? ");
			
			pstmt = con.prepareStatement(selectBoard.toString());
			//5. 바인드 변수 값 설정
			int pstmtIdx=0;
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(++pstmtIdx, rDTO.getKeyword());
			}	
			pstmt.setInt(++pstmtIdx, rDTO.getStartNum());
			pstmt.setInt(++pstmtIdx, rDTO.getEndNum());
			
			
			AdminQnaDTO qDTO = null;
			rs=pstmt.executeQuery();			
			//6. 조회결과 얻기	
			while(rs.next()) {
				qDTO = new AdminQnaDTO();
				qDTO.setInquiryNum(rs.getInt("inquiry_num"));
				qDTO.setInquiryTitle(rs.getString("inquiry_title"));
				qDTO.setMemberName(rs.getString("id"));
				qDTO.setInquiryReturn(rs.getString("has_return"));
				qDTO.setInquiryDate(rs.getDate("inquiry_date"));
				list.add(qDTO);
			}
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		
		
		return list;
		
	}
	
	public void insertBoard(AdminQnaDTO QDTO) throws SQLException {
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			String insertBoard="insert into board(num, title, content, ip, id) values(seq_board.nextval, ?, ?, ?, ?) ";
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(insertBoard);
			
		//6. 쿼리문 수행 후 결과 얻기
			pstmt.executeUpdate();
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
		
	}//insert board
	
	
	public AdminQnaDTO selectQnaDetail(int num) throws SQLException {
		AdminQnaDTO qDTO = null;
		
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
			selectDetail.append("	select inquiry_title, email, id, inquiry_msg, inquiry_return, inquiry_date")
			.append("	from (SELECT inquiry_num, inquiry_title, id, email, inquiry_msg, inquiry_return, inquiry_date FROM inquiry i LEFT JOIN member m ON m.member_num = i.member_num)	")
			.append("	where inquiry_num = ?	");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				qDTO= new AdminQnaDTO();
				qDTO.setInquiryTitle(rs.getString("inquiry_title"));
				qDTO.setMemberEmail(rs.getString("email"));
				qDTO.setMemberName(rs.getString("id"));
				//CLOB 처리문
				BufferedReader br = null;
				StringBuilder content = new StringBuilder();
				
				try {
					br = new BufferedReader(rs.getClob("inquiry_msg").getCharacterStream());
					String readLine="";
					while((readLine=br.readLine())!=null) {
						content.append(readLine);
					}
					if(br != null) {br.close();};
					
				} catch (IOException e) {
				} catch (NullPointerException nfe) {
				}
				qDTO.setInquiryMsg(content.toString());
				//CLOB 처리문 끝
				
				br = null;
				StringBuilder content2 = new StringBuilder();
				
				try {
					br = new BufferedReader(rs.getClob("inquiry_return").getCharacterStream());
					String readLine="";
					while((readLine=br.readLine())!=null) {
						content2.append(readLine);
					}
					if(br != null) {br.close();};
					
				} catch (IOException e) {
				} catch (NullPointerException nfe) {
				}
				
				
				qDTO.setInquiryReturn(content2.toString());
				
				//CLOB 처리문 끝
				qDTO.setInquiryDate(rs.getDate("inquiry_date"));

			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return qDTO;
		
	}
	
	public int updateQna(int num,String msg) throws SQLException {
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
			.append("	update	inquiry	")
			.append("	set		inquiry_return=?	")
			.append("	where	inquiry_num=?	");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(updateBoard.toString());
			pstmt.setString(1, msg);
			pstmt.setInt(2, num);
			
		//6. 쿼리문 수행 후 결과 얻기
			cnt=pstmt.executeUpdate();
			
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
		return cnt;
	}//update board
	
	
}
