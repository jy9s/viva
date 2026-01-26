package kr.co.viva.notice;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Clob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class NoticeDAO {
	private static NoticeDAO nDAO;
	
	private NoticeDAO(){
		
	}
	
	public static NoticeDAO getInstance() {
		if(nDAO ==null) {
			nDAO=new NoticeDAO();
			
		}
		return nDAO;
	}
	
	
	public int selectNoticeTotalCnt(RangeDTO rDTO) throws SQLException, IOException {
		int totalCnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectTotalCnt = new StringBuilder();
			selectTotalCnt
			.append("	select count(*) cnt from notice	");
				if(rDTO.getCategory()!=null && !"".equals(rDTO.getCategory() ) && !"전체".equals(rDTO.getCategory())) {
					selectTotalCnt.append("where notice_type = ?");
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectTotalCnt.append("   and instr(notice_title,?)!=0");
					}//end if
				}else {
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectTotalCnt.append("where instr(notice_title,?)!=0");
					}//end if
			}//end if
				
			pstmt = con.prepareStatement(selectTotalCnt.toString());
			
			int pstmtNum=0;
				if(rDTO.getCategory() !=null && !"".equals(rDTO.getCategory() ) && !"전체".equals(rDTO.getCategory())) {
					pstmt.setString(++pstmtNum, rDTO.getCategory());
					if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getKeyword());
					}//end if	
				}else{
					if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getKeyword());
					}//end if	
			}//end if
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			}//end while
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return totalCnt;
	}//selectNoticeTotalCnt
	
	
	public List<NoticeDTO> selectNotice(RangeDTO rDTO) throws SQLException, IOException {
		List<NoticeDTO> list = new ArrayList<NoticeDTO>();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectNotice = new StringBuilder();
			selectNotice
			.append("	select noticenum, notice_title, notice_views, notice_date,notice_type	")
			.append("	from (select row_number() over(order by noticenum) rnum, noticenum,notice_title, notice_views, notice_date ,notice_type from notice ");
				if(rDTO.getCategory() !=null && !"".equals(rDTO.getCategory() ) && !"전체".equals(rDTO.getCategory())) {
					selectNotice.append("where notice_type = ?");
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectNotice.append("   and instr(notice_title,?)!=0");
					}//end if
				}else {
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectNotice.append("where instr(notice_title,?)!=0");
					}//end if
			}//end if
			selectNotice.append("	)where rnum between ? and ?	");
			
			pstmt = con.prepareStatement( selectNotice.toString());
			
			int pstmtNum=0;
				if(rDTO.getCategory() !=null && !"".equals(rDTO.getCategory() ) && !"전체".equals(rDTO.getCategory())) {
					pstmt.setString(++pstmtNum, rDTO.getCategory());
					if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getKeyword());
					}//end if	
				}else{
					if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getKeyword());
					}//end if	
			}//end if
			pstmt.setInt(++pstmtNum, rDTO.getStartNum());
			pstmt.setInt(++pstmtNum, rDTO.getEndNum());
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				NoticeDTO nDTO = new NoticeDTO();
				nDTO.setNum(rs.getString("noticenum"));
				nDTO.setCategory(rs.getString("notice_type"));
				nDTO.setTitle(rs.getString("notice_title"));
				nDTO.setInputDate(rs.getString("notice_date"));
				list.add(nDTO);
			}//end while
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectNotice
	
	public NoticeDTO selectNoticeDetail(int noticeNum) throws SQLException, IOException {
		NoticeDTO nDTO = new NoticeDTO();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectNoticeDetail = new StringBuilder();
			selectNoticeDetail
			.append("	select noticenum, notice_title, notice_views, notice_date,notice_type,notice_msg	")
			.append("	from notice	")
			.append("	where noticenum = ?	");
			pstmt = con.prepareStatement( selectNoticeDetail.toString());
			
			pstmt.setInt(1, noticeNum);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				nDTO.setNum(rs.getString("noticenum"));
				nDTO.setCategory(rs.getString("notice_type"));
				nDTO.setTitle(rs.getString("notice_title"));
				nDTO.setInputDate(rs.getString("notice_date"));
//clob 받기
				StringBuilder intro = new StringBuilder();
				Clob clob = rs.getClob("notice_msg");
							
				if(clob!=null) {
					BufferedReader br = null;
					try {
						br = new BufferedReader(clob.getCharacterStream());
						String temp ="";
					
						while ( (temp=br.readLine())!=null) { //읽어들인 값이 존재하면 
							intro.append(temp).append("\n");
						}//end while 
					}finally {
						nDTO.setMsg(String.valueOf(intro));
					}//end finally
				}//end if
				
			}//end if
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return nDTO;
	}//selectNoticeDetail
	
	
	public int updateCnt(int inquiryNum )  throws SQLException, IOException {
		int cnt=0;
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn();
			
			StringBuilder updateCnt = new StringBuilder();
			updateCnt
			.append("	update notice	")
			.append("	set notice_views = notice_views+1	")
			.append("	where noticeNum = ?	");
			pstmt = con.prepareStatement( updateCnt.toString());
			
			pstmt.setInt(1, inquiryNum);
			
			cnt= pstmt.executeUpdate();
			
			
		}finally{
			db.dbClose(null, pstmt, con);
		}//end finally
		return cnt;
	}//updateCnt
}//class
