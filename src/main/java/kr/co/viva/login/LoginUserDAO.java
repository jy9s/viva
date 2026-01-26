package kr.co.viva.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.viva.notice.DbConn;

public class LoginUserDAO {
	
	private static LoginUserDAO logDAO;
	
	private LoginUserDAO() {
		
	}
	
	public static LoginUserDAO getInstance() {
		
		if(logDAO==null) {
			logDAO = new LoginUserDAO();			
		}
		
		return logDAO;
	}
	
	
	public UserDTO SelectUser(String id, String pw) throws SQLException {
		
		UserDTO uDTO = new UserDTO();
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con = db.getConn();
		
			String selectQuery = "select member_num, id, pass, name from member where id=? and pass=? "; 
		
			pstmt=con.prepareStatement(selectQuery);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uDTO.setUserNum(rs.getInt("member_num"));
				uDTO.setId(rs.getString("id"));
				uDTO.setPw(rs.getString("pass"));
				uDTO.setName(rs.getString("name"));
			}
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return uDTO;
	}
	
}