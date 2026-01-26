package kr.co.viva.modifyInfo;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.viva.notice.DbConn;

public class ModifyInfoDAO {
private static ModifyInfoDAO jDAO;
	
	private ModifyInfoDAO(){
		
	}
	
	public static ModifyInfoDAO getInstance() {
		if(jDAO ==null) {
			jDAO=new ModifyInfoDAO();
			
		}
		return jDAO;
	}//getInstance
	
	public ModifyInfoDTO selectInfo(String id) throws SQLException {
			ModifyInfoDTO jDTO = new ModifyInfoDTO();
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
	 			
				rs=pstmt.executeQuery();
				
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
	
	
	public int updateInfo(ModifyInfoDTO miDTO ) throws SQLException, IOException {
		int cnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn();
			
			StringBuilder updateInfo = new StringBuilder();
			updateInfo
			.append(" update member set BIRTH=?, EMAIL=?, ZIPCODE=?, ADDR=?, ADDRDETAIL=? where id = ? ");
			
			pstmt = con.prepareStatement(updateInfo.toString());
			
			pstmt.setString(1, miDTO.getBirth());
			pstmt.setString(2, miDTO.getEmail());
			pstmt.setInt(3, miDTO.getZipCode());
			pstmt.setString(4, miDTO.getAddr());
			pstmt.setString(5, miDTO.getAddrDetail());
			pstmt.setString(6, miDTO.getId());
			
			cnt= pstmt.executeUpdate();
			
		}finally{
			db.dbClose(null, pstmt, con);
		}//end finally
		return cnt;
	}//updateInquiry
	
	public int updateWithbraw(String id) throws SQLException, IOException {
		int cnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn();
			
			StringBuilder updateInfo = new StringBuilder();
			updateInfo
			.append(" update member set BIRTH='', EMAIL='', ZIPCODE='', ADDR='', ADDRDETAIL='', tell='', name='', pass='' where id = ? ");
			
			pstmt = con.prepareStatement(updateInfo.toString());
			
			pstmt.setString(1, id);
			
			cnt= pstmt.executeUpdate();
			
		}finally{
			db.dbClose(null, pstmt, con);
		}//end finally
		return cnt;
	}//updateInquiry
}
