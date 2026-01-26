package kr.co.viva.login;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.viva.notice.DbConn;

public class JoinDAO {
private static JoinDAO jDAO;
	
	private JoinDAO(){
		
	}
	
	public static JoinDAO getInstance() {
		if(jDAO ==null) {
			jDAO=new JoinDAO();
			
		}
		return jDAO;
	}//getInstance
	
	
	public int insertMember(JoinDTO jDTO) throws SQLException {
		int cnt=0;
			DbConn db = DbConn.getInstance("jdbc/dbcp");
			Connection con = null;
			PreparedStatement pstmt = null;
			
			try {
				con = db.getConn();
				StringBuilder insertInquiry = new StringBuilder();
				
				insertInquiry
				.append("	 insert into MEMBER (MEMBER_NUM, ID, PASS, NAME, BIRTH, EMAIL, ZIPCODE, ADDR, ADDRDETAIL, TELL)	")
				.append("	values ( seq_member_num.nextval, ?,?,?,?,?,?,?, ?, ?)");
				
	 			pstmt = con.prepareStatement(insertInquiry.toString());
				
	 			pstmt.setString(1, jDTO.getId());
	 			pstmt.setString(2, jDTO.getPass());
	 			pstmt.setString(3, jDTO.getName());
	 			pstmt.setObject(4, jDTO.getBirth());
	 			pstmt.setString(5, jDTO.getEmail());
	 			pstmt.setInt(6, jDTO.getZipCode());
	 			pstmt.setString(7, jDTO.getAddr());
	 			pstmt.setString(8, jDTO.getAddrDetail());
	 			pstmt.setString(9, jDTO.getTel());
	 			
				cnt= pstmt.executeUpdate();
				
				
			}finally{
				db.dbClose(null, pstmt, con);
			}//end finally
			return cnt;
		
	}//insertMember
	
	public boolean selectId(String id) throws SQLException {
		boolean flag=false;
			DbConn db = DbConn.getInstance("jdbc/dbcp");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = db.getConn();
				StringBuilder selectId = new StringBuilder();
				
				selectId
				.append("	select id from member where id=? 	");
				
	 			pstmt = con.prepareStatement(selectId.toString());
				
	 			pstmt.setString(1, id);
	 			
				rs= pstmt.executeQuery();
				if(rs.next()) {
					flag=true;
				}
				
			}finally{
				db.dbClose(null, pstmt, con);
			}//end finally
			return flag;
		
	}//insertMember
	
	
	
	public JoinDTO selectInfo(String id) throws SQLException {
			JoinDTO jDTO = new JoinDTO();
			DbConn db = DbConn.getInstance("jdbc/dbcp");
			Connection con = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			try {
				con = db.getConn();
				StringBuilder insertInquiry = new StringBuilder();
				
				insertInquiry
				.append("	 select  name, birth, email, zipcode, addr, addrdetail, tell from member	")
				.append("	where id=?");
				
	 			pstmt = con.prepareStatement(insertInquiry.toString());
				
	 			pstmt.setString(1, id);
	 			
				pstmt.executeQuery();
				
				if(rs.next()) {
					jDTO.setName(rs.getString("name"));
					jDTO.setBirth(rs.getString("birth"));
					jDTO.setEmail(rs.getString("email"));
					jDTO.setZipCode(rs.getInt("zipcode"));
					jDTO.setAddr(rs.getString("addr"));
					jDTO.setAddrDetail(rs.getString("addrdetail"));
					jDTO.setTel(rs.getString("tell"));
					
				}
			}finally{
				db.dbClose(rs, pstmt, con);
			}//end finally
			return jDTO;
		
	}//insertMember
}
