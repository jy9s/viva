package kr.co.viva.mypage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;

public class MypageDAO {
	private static MypageDAO mDAO;
	
	private MypageDAO(){
		
	}
	
	public static MypageDAO getInstance() {
		if(mDAO ==null) {
			mDAO=new MypageDAO();
			
		}
		return mDAO;
	}
	
	
	public MypageDTO selectMember(String id) throws SQLException, IOException {
		MypageDTO mDTO = new MypageDTO();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			String selectMember =  "	select name,member_num from member where id = ?	";
			pstmt = con.prepareStatement( selectMember);
			pstmt.setString(1, id);
			rs= pstmt.executeQuery();
			if(rs.next()) {
				mDTO.setName(rs.getString("name"));
				mDTO.setNum(rs.getInt("member_num"));
			}//end if
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return mDTO;
	}//selectNotice
	
	public List<MyTicketDTO> selectMyTicket(int num) throws SQLException, IOException {
		List<MyTicketDTO> myticketList = new ArrayList<MyTicketDTO>();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			StringBuilder selectMyticket = new StringBuilder(); 
			selectMyticket
			.append("	select  tr.t_res_num tiketNum, tr.t_res_date resDate,mt.use_date useDate"  )
			.append( ", t.ticket_name ticketName ,t.adult_price adultPrice ,t.kids_price kidPrice ,t.teenager_price teenagerPrice ,pr.discount discount	")
			.append("	from  ticket_reserve tr , normal_ticket mt, ticket t , promotion pr	")
			.append("	where tr.t_res_num = mt.t_res_num and  tr.ticket_num = t.ticket_num	")
			.append("	and tr.prom_num = pr.prom_num and  tr.member_num=?	");
			
			pstmt = con.prepareStatement( selectMyticket.toString());
			pstmt.setInt(1, num);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				MyTicketDTO mtDTO = new MyTicketDTO();
				mtDTO = new MyTicketDTO();
				mtDTO.setTicketNum(rs.getInt("tiketNum"));
				mtDTO.setTicketName(rs.getString("ticketName"));
				mtDTO.settResDate(rs.getDate("resDate"));
				mtDTO.setUseDate(rs.getDate("useDate"));
				mtDTO.setAdultPrice(rs.getInt("adultPrice"));
				mtDTO.setTeenagerPrice(rs.getInt("teenagerPrice"));
				mtDTO.setKidPrice(rs.getInt("kidPrice"));
				mtDTO.setDiscount(rs.getInt("discount"));
				
				myticketList.add(mtDTO);
			}//end if
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return myticketList;
	}//selectMyTicket
	
	
	public List<PersonalDTO> selectPersonal(int resNum) throws SQLException, IOException {
		 List<PersonalDTO> personList = new ArrayList<PersonalDTO>();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			StringBuilder selectPerson = new StringBuilder(); 
			selectPerson
			.append("	select personal_type, personal_cnt	")
			.append("	from  personal	")
			.append("	where t_res_num= ?	");
			
			pstmt = con.prepareStatement( selectPerson.toString());
			pstmt.setInt(1, resNum);
			rs= pstmt.executeQuery();
			while(rs.next()) {
				PersonalDTO pDTO = new PersonalDTO();
				pDTO.setType(rs.getInt(""));
				pDTO.setNum(rs.getInt(""));
				
				personList.add(pDTO);
				}//end if
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return personList;
	}//selectPersonal
}//class
