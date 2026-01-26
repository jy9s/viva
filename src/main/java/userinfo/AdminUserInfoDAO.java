package userinfo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class AdminUserInfoDAO {
	
	private static AdminUserInfoDAO uiDAO;
	
	private AdminUserInfoDAO() {
		
	}
	
	public static AdminUserInfoDAO getInstance() {
		
		if(uiDAO==null) {
			uiDAO = new AdminUserInfoDAO();
		}
		
		
		return uiDAO;
	}
	
	public int selectUserTotalCnt(AdminUserRangeDTO rDTO) throws SQLException {
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
			selectTotal.append("select count(*) cnt from member ");
			//dynamic query : 검색키워드가 있다면 검색 키워드에 해당하는 글의 갯수를 얻기
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				selectTotal.append(" where instr(")
				.append(rDTO.getFieldStr()).append(",?) ! = 0");				
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
	
	public List<AdminUserInfoDTO> selectUserInfo(AdminUserRangeDTO rDTO) throws SQLException{
		List<AdminUserInfoDTO> list = new ArrayList<AdminUserInfoDTO>();
		
		DbConn db= DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con=db.getConn();
			
			StringBuilder selectUser = new StringBuilder();
			selectUser
			.append(" select member_num, id, name, email, addr, tell, del_flag, inputdate from ")
			.append(" (select member_num, id, name, email, addr, tell, del_flag, inputdate, row_number() over(order by inputdate desc) rnum from member	");
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				selectUser.append(" where instr(")
				.append(rDTO.getFieldStr()).append(",?) ! = 0	");				
			}//end if
			
			selectUser.append("	) where rnum between ? and ? ");
			
			
			pstmt=con.prepareStatement(selectUser.toString());
			
			int pstmtIdx=0;
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
			pstmt.setString(++pstmtIdx, rDTO.getKeyword());
			}
			pstmt.setInt(++pstmtIdx, rDTO.getStartNum());
			pstmt.setInt(++pstmtIdx, rDTO.getEndNum());

			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				AdminUserInfoDTO uiDTO = new AdminUserInfoDTO();
				uiDTO.setUserNum(rs.getInt("member_num"));
				uiDTO.setUserId(rs.getString("id"));
				uiDTO.setUserName(rs.getString("name"));
				uiDTO.setUserEmail(rs.getString("email"));
				uiDTO.setUserAddr(rs.getString("addr"));
				uiDTO.setUserTel(rs.getString("tell"));
				uiDTO.setUserFlag(rs.getString("del_flag"));
				uiDTO.setUserInputDate(rs.getDate("inputdate"));
				
				list.add(uiDTO);
			}
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}
	
	
	public AdminUserInfoDTO selectUserInfo(int num) throws SQLException{
		AdminUserInfoDTO uiDTO = new AdminUserInfoDTO();
		
		DbConn db= DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con=db.getConn();
			String selectUser = "select member_num, id, name, email, addr, tell, del_flag, inputdate from member where member_num=? ";
			
			pstmt=con.prepareStatement(selectUser);
			pstmt.setInt(1, num);
			rs=pstmt.executeQuery();
			if(rs.next()) {
				uiDTO.setUserNum(rs.getInt("member_num"));
				uiDTO.setUserId(rs.getString("id"));
				uiDTO.setUserName(rs.getString("name"));
				uiDTO.setUserEmail(rs.getString("email"));
				uiDTO.setUserAddr(rs.getString("addr"));
				uiDTO.setUserTel(rs.getString("tell"));
				uiDTO.setUserFlag(rs.getString("del_flag"));
				uiDTO.setUserInputDate(rs.getDate("inputdate"));				
			}
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return uiDTO;
	}

}
