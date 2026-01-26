package kr.co.viva.inquiry;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;

public class InquiryDAO {
	private static InquiryDAO nDAO;
	
	private InquiryDAO(){
		
	}
	
	public static InquiryDAO getInstance() {
		if(nDAO ==null) {
			nDAO=new InquiryDAO();
			
		}
		return nDAO;
	}
	
	
	public int insertInquiry(InquiryDTO nDTO) throws SQLException, IOException {
		int cnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn();
			StringBuilder insertInquiry = new StringBuilder();
			
			insertInquiry
			.append("	insert into inquiry(inquiry_num, member_num, inquiry_title, inquiry_msg)	")
			.append("	values(seq_inquiry_num.nextval,?,?,?)	");
			
 			pstmt = con.prepareStatement(insertInquiry.toString());
			
 			pstmt.setInt(1, nDTO.getMemberNum());
 			pstmt.setString(2, nDTO.getTitle());
 			pstmt.setString(3, nDTO.getMsg());
 			
			cnt= pstmt.executeUpdate();
			
			
		}finally{
			db.dbClose(null, pstmt, con);
		}//end finally
		return cnt;
	}//insertInquiry
	
	public int selectMemberNum(String id) throws SQLException, IOException {
		int num = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			con = db.getConn();
			StringBuilder insertInquiry = new StringBuilder();
			
			insertInquiry
			.append("	select member_num from member	")
			.append("	where id=?	");
			
 			pstmt = con.prepareStatement(insertInquiry.toString());
			
 			pstmt.setString(1, id);
 			
			rs = pstmt.executeQuery();
			if(rs.next()) {
				num = rs.getInt("member_num");
			}
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return num;
	}//selectMemberNum
	
	
	public int selectInquiryTotalCnt(int num) throws SQLException, IOException {
		int totalCnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectTotalCnt = new StringBuilder();
			selectTotalCnt
			.append("	select count(*) cnt from inquiry where member_num = ?	");
			
			pstmt = con.prepareStatement(selectTotalCnt.toString());
			
			pstmt.setInt(1, num);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			}//end while
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return totalCnt;
	}//selectNoticeTotalCnt
	
	
	public List<InquiryDTO> selectInquiry(RangeDTO rDTO , int num) throws SQLException, IOException {
		List<InquiryDTO> list = new ArrayList<InquiryDTO>();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectInquiry = new StringBuilder();
			selectInquiry
			.append("	select INQUIRY_NUM, INQUIRY_TITLE, INQUIRY_RETURN, INQUIRY_DATE	 ")
			.append("	from (select row_number() over(order by INQUIRY_NUM) rnum,INQUIRY_NUM, INQUIRY_TITLE, INQUIRY_RETURN, INQUIRY_DATE from INQUIRY	")
			.append("	where member_num = ? )where rnum between ? and ?	");
			
			pstmt = con.prepareStatement( selectInquiry.toString());
			
			pstmt.setInt(1, num);
			pstmt.setInt(2, rDTO.getStartNum());
			pstmt.setInt(3, rDTO.getEndNum());
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				InquiryDTO iDTO = new InquiryDTO();
				iDTO.setInquiryNum(rs.getInt("inquiry_num"));
				iDTO.setTitle(rs.getString("inquiry_title"));
				iDTO.setInquiryReturn(rs.getString("inquiry_return"));
				iDTO.setInputDate(rs.getDate("inquiry_date"));
				
				list.add(iDTO);
			}//end while
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectNotice
	
	
	public InquiryDTO selectInquiryDetail(int inquiryNum) throws SQLException, IOException {
		InquiryDTO iDTO = new InquiryDTO();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectInquiryDetail = new StringBuilder();
			selectInquiryDetail
			.append("	select inquiry_num, member_num, adminnum, inquiry_title, inquiry_msg, inquiry_return, inquiry_date	")
			.append("	from inquiry	")
			.append("	where inquiry_num=?	");
			pstmt = con.prepareStatement( selectInquiryDetail.toString());
			
			pstmt.setInt(1, inquiryNum);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				iDTO.setTitle(rs.getString("inquiry_title"));
				iDTO.setInquiryReturn(rs.getString("inquiry_return"));
				iDTO.setAdminNum(rs.getInt("adminnum"));
//clob 받기
				StringBuilder intro = new StringBuilder();
				Clob clob = rs.getClob("inquiry_msg");
							
				if(clob!=null) {
					BufferedReader br = null;
					try {
						br = new BufferedReader(clob.getCharacterStream());
						String temp ="";
					
						while ( (temp=br.readLine())!=null) { //읽어들인 값이 존재하면 
							intro.append(temp).append("\n");
						}//end while 
					}finally {
						iDTO.setMsg(String.valueOf(intro));
					}//end finally
				}//end if
				
			}//end if
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return iDTO;
	}//selectInquiryDetail
	
	
	public int deleteInquiry(int inqNum, int memberNum ) throws SQLException, IOException {
		int cnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn();
			
			StringBuilder deleteInquiry = new StringBuilder();
			deleteInquiry
			.append("	delete from inquiry where inquiry_num=? and member_num=? ");
			
			pstmt = con.prepareStatement(deleteInquiry.toString());
			
			pstmt.setInt(1, inqNum);
			pstmt.setInt(2, memberNum);
			
			cnt= pstmt.executeUpdate();
			
		}finally{
			db.dbClose(null, pstmt, con);
		}//end finally
		return cnt;
	}//selectNoticeTotalCnt

	public int updateInquiry(InquiryDTO iDTO ) throws SQLException, IOException {
		int cnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn();
			
			StringBuilder deleteInquiry = new StringBuilder();
			deleteInquiry
			.append("	update inquiry set INQUIRY_MSG=?, INQUIRY_TITLE=? where inquiry_num=? and member_num=? ");
			
			pstmt = con.prepareStatement(deleteInquiry.toString());
			
			pstmt.setString(1, iDTO.getMsg());
			pstmt.setString(2, iDTO.getTitle());
			pstmt.setInt(3, iDTO.getInquiryNum());
			pstmt.setInt(4, iDTO.getMemberNum());
			
			cnt= pstmt.executeUpdate();
			
		}finally{
			db.dbClose(null, pstmt, con);
		}//end finally
		return cnt;
	}//updateInquiry
	

}//class
