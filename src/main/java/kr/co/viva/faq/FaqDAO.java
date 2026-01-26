package kr.co.viva.faq;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;

public class FaqDAO {
	private static FaqDAO nDAO;
	
	private FaqDAO(){
		
	}
	
	public static FaqDAO getInstance() {
		if(nDAO ==null) {
			nDAO=new FaqDAO();
			
		}
		return nDAO;
	}
	
	
	public int selectFaqTotalCnt(RangeDTO rDTO) throws SQLException, IOException {
		int totalCnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			StringBuilder selectTotalCnt = new StringBuilder();
			String category=null;
			selectTotalCnt
			.append("	select count(*) cnt from faq	");
			if(rDTO.getCategory() !=null && !rDTO.getCategory().isEmpty()) {
				category = rDTO.getCategory().replaceAll("\\u00A0", " ").trim();
				if(!"전체".equals(rDTO.getCategory())) {
					selectTotalCnt.append("where faq_type = ?");
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectTotalCnt.append("   and instr(faq_title,?)!=0");
					}//end if
				}else {
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectTotalCnt.append("where instr(faq_title,?)!=0");
					}//end if
				}
			}//end if
			pstmt = con.prepareStatement(selectTotalCnt.toString());
			
			int pstmtNum=0;
			if(rDTO.getCategory() !=null && !rDTO.getCategory().isEmpty()) {
				if(!"전체".equals(rDTO.getCategory())) {
					pstmt.setString(++pstmtNum, category);
					if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getKeyword());
					}//end if	
				}else{
					if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getKeyword());
					}//end if	
				}
			}//end if
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				totalCnt = rs.getInt("cnt");
			}//end while
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return totalCnt;
	}//selectNotice
	
	
	public List<FaqDTO> selectFaq(RangeDTO rDTO) throws SQLException, IOException {
		List<FaqDTO> list = new ArrayList<FaqDTO>();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectNotice = new StringBuilder();
			selectNotice
			.append("	select faq_num, faq_title, faq_msg, faq_type	")
			.append("	from (select row_number() over(order by faq_num) rnum, faq_num, faq_title, faq_msg, faq_type from faq ");
			String category  = null;
			if(rDTO.getCategory() !=null && !rDTO.getCategory().isEmpty()) {
				category = rDTO.getCategory().replaceAll("\\u00A0", " ").trim();
				if(!"전체".equals(rDTO.getCategory())) {
					selectNotice.append("where faq_type = ?");
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectNotice.append("   and instr(faq_title,?)!=0");
					}//end if
				}else {
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectNotice.append("where instr(faq_title,?)!=0");
					}//end if
				}
			}//end if
			selectNotice.append("	)where rnum between ? and ?	");
			
			pstmt = con.prepareStatement( selectNotice.toString());
			
			int pstmtNum=0;
			if(rDTO.getCategory() !=null && !rDTO.getCategory().isEmpty()) {
				if(!"전체".equals(rDTO.getCategory())) {
					pstmt.setString(++pstmtNum, category);
					if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getKeyword());
					}//end if	
				}else{
					if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getKeyword());
					}//end if	
				}
			}//end if
			pstmt.setInt(++pstmtNum, rDTO.getStartNum());
			pstmt.setInt(++pstmtNum, rDTO.getEndNum());
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				FaqDTO fDTO = new FaqDTO();
				fDTO.setNum(rs.getString("faq_num"));
				fDTO.setCategory(rs.getString("faq_type"));
				fDTO.setTitle(rs.getString("faq_title"));
				fDTO.setMsg(rs.getString("faq_msg"));
				list.add(fDTO);
			}//end while
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectNotice
	
	
}//class
