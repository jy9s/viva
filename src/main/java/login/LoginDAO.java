package login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import db.DbConn;

public class LoginDAO {
	
	private static LoginDAO logDAO;
	
	private LoginDAO() {
		
	}
	
	public static LoginDAO getInstance() {
		
		if(logDAO==null) {
			logDAO = new LoginDAO();			
		}
		
		return logDAO;
	}
	
	
	public AdminAdminDTO SelectAdmin(String id, String pw) throws SQLException {
		
		AdminAdminDTO adDTO = new AdminAdminDTO();
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con = db.getConn();
		
			String selectQuery = "select adminnum, adminid, adminpass, adminname from admin where adminid=? and adminpass=? "; 
		
			pstmt=con.prepareStatement(selectQuery);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				adDTO.setAdminNum(rs.getInt("adminnum"));
				adDTO.setAdminId(rs.getString("adminid"));
				adDTO.setAdminPass(rs.getString("adminpass"));
				adDTO.setAdminName(rs.getString("adminname"));				
			}
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return adDTO;
	}
	
	
public UserDTO SelectUser(String id, String pw) throws SQLException {
		
		UserDTO uDTO = new UserDTO();
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt=null;
		ResultSet rs = null;
		
		try {
			con = db.getConn();
		
			String selectQuery = "select member_num,id,pass,name,birth,email,zipcode,addr,addrdetail,tell,inputdate from member where id=? and pass=? and del_flag='N' "; 
		
			pstmt=con.prepareStatement(selectQuery);
			pstmt.setString(1, id);
			pstmt.setString(2, pw);
		
			rs = pstmt.executeQuery();
			
			if(rs.next()) {
				uDTO.setUserNum(rs.getInt("member_num"));
				uDTO.setId(rs.getString("id"));
				uDTO.setPw(rs.getString("pass"));
				uDTO.setName(rs.getString("name"));
				uDTO.setBirth(rs.getString("birth"));
				uDTO.setEmail(rs.getString("email"));
				uDTO.setZipCode(rs.getInt("zipcode"));
				uDTO.setAddr(rs.getString("addr"));
				uDTO.setAddrDetail(rs.getString("addredetail"));
				uDTO.setTel(rs.getString("tell"));
				uDTO.setInputDate(rs.getDate("inputdate"));
			}
		
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		
		return uDTO;
	}
	
}
