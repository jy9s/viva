package kr.co.viva.reserveHistory;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;

public class ReserveHistoryDAO {
	private static ReserveHistoryDAO nDAO;
	
	private ReserveHistoryDAO(){
		
	}
	
	public static ReserveHistoryDAO getInstance() {
		if(nDAO ==null) {
			nDAO=new ReserveHistoryDAO();
			
		}
		return nDAO;
	}
	
	
	public int selectReserveTotalCnt(int num, RangeDTO rDTO) throws SQLException, IOException {
		int totalCnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectTotalCnt = new StringBuilder();
			selectTotalCnt
			.append("	select count(*) cnt ")
			.append("	from PERFORMANCE p, PERF_SCHEDULE ps, PERF_RESERVE pr	")
			.append("	where pr.PERF_SCHEDULE_NUM = ps.PERF_SCHEDULE_NUM  and ps.PERF_NUM = p.PERF_NUM	")
			.append("	and pr.MEMBER_NUM =? ");
			if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
				selectTotalCnt.append("   and instr(p.PERF_TITLE,?)!=0");
			}//end if
			
			pstmt = con.prepareStatement(selectTotalCnt.toString());
			
			int pstmtNum=0;
			
			pstmt.setInt(++pstmtNum, num);
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(++pstmtNum, rDTO.getKeyword());
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
	
	
	public List<ReserveHistoryDTO> selectReserve(int num ,RangeDTO rDTO) throws SQLException, IOException {
		List<ReserveHistoryDTO> list = new ArrayList<ReserveHistoryDTO>();
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectNotice = new StringBuilder();
			selectNotice
			.append("	select  pnum, resdate,title,pdate, person,state	")
			.append("	from(select row_number() over(order by pr.p_res_num) rnum, pr.p_res_num pnum, pr.p_res_date resdate, p.perf_title title, ps.perf_date  pdate, pr.p_res_person person,pa.refund_state state ")
			.append("	from performance p, perf_schedule ps, perf_reserve pr ,pay pa  ")
			.append("	where pr.perf_schedule_num = ps.perf_schedule_num  and ps.perf_num = p.perf_num and pr.P_RES_NUM= pa.P_RES_NUM")
			.append("	and pr.member_num =?  ");
					if(rDTO.getKeyword() !=null && !rDTO.getKeyword().isEmpty()) {
						selectNotice.append("   and instr(p.perf_title,?)!=0");
					}//end if
			selectNotice.append("	)where rnum between ? and ?	");
			
			pstmt = con.prepareStatement( selectNotice.toString());
			
			int pstmtNum=0;
			pstmt.setInt(++pstmtNum, num);
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(++pstmtNum, rDTO.getKeyword());
			}//end if	
			pstmt.setInt(++pstmtNum, rDTO.getStartNum());
			pstmt.setInt(++pstmtNum, rDTO.getEndNum());
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				ReserveHistoryDTO rhDTO = new ReserveHistoryDTO();
				rhDTO.setNum(rs.getInt("pnum"));
				rhDTO.setPayDate(rs.getDate("resdate"));
				rhDTO.setTitle(rs.getString("title"));
				rhDTO.setPerfDate(rs.getDate("pdate"));
				rhDTO.setPersonCnt(rs.getInt("person"));
				rhDTO.setState(rs.getString("state"));
				list.add(rhDTO);
			}//end while
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectReserve
	
	public ReserveDetailDTO selectReserveDetail(int resNum) throws SQLException, IOException {
		ReserveDetailDTO rdDTO = new ReserveDetailDTO();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectReserveDetail = new StringBuilder();
			selectReserveDetail
			.append("	select pr.p_res_num resnum, pr.P_RES_DATE resdate, p.PERF_TITLE title, ps.PERF_DATE  perfdate, pr.P_RES_PERSON person,pa.REFUND_STATE state	")
			.append("	,pr.P_RES_NAME name,p.PERF_LOC loc, pa.PAY_DATE pdate, pa.PAY_NUM payNum, pi.PAY_AGENCY agency, pa.PAY_PRICE price, pi.INSTALLMENT installment	")
			.append("	from PERFORMANCE p, PERF_SCHEDULE ps, PERF_RESERVE pr, pay pa, pay_info pi	")
			.append("	where pr.PERF_SCHEDULE_NUM = ps.PERF_SCHEDULE_NUM  and ps.PERF_NUM = p.PERF_NUM and pr.P_RES_NUM= pa.P_RES_NUM and pa.PAY_NUM=pi.PAY_NUM	")
			.append("	and pr.P_RES_NUM =? ");
			
			pstmt = con.prepareStatement( selectReserveDetail.toString());
			
			pstmt.setInt(1, resNum);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				rdDTO.setResNum(rs.getInt("resnum"));
				rdDTO.setPerfDate(rs.getDate("perfdate"));
				rdDTO.setResDate(rs.getDate("resdate"));
				rdDTO.setPersonCnt(rs.getInt("person"));
				rdDTO.setReserveName(rs.getString("name"));
				rdDTO.setLoc(rs.getInt("loc"));
				rdDTO.setTitle(rs.getString("title"));
				rdDTO.setState(rs.getString("state"));
				rdDTO.setPayDate(rs.getDate("pdate"));
				rdDTO.setPayNum(rs.getInt("payNum"));
				rdDTO.setPayAgency(rs.getString("agency"));
				rdDTO.setPayPrice(rs.getInt("price"));
				rdDTO.setInstallment(rs.getInt("installment"));
			}//end if
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return rdDTO;
	}//selectNoticeDetail
	
	public int updateRefundState(int resNum) throws SQLException, IOException {
		int cnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectTotalCnt = new StringBuilder();
			selectTotalCnt
			.append(" 	update pay	 ")
			.append("	set refund_state='Y' ")
			.append("	where p_res_num = ? ");
			
			pstmt = con.prepareStatement(selectTotalCnt.toString());
			pstmt.setInt(1, resNum);
			
			cnt= pstmt.executeUpdate();
			
			
		}finally{
			db.dbClose(null, pstmt, con);
		}//end finally
		return cnt;
	}//selectNoticeTotalCnt
}//class


