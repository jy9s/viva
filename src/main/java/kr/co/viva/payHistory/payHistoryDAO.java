package kr.co.viva.payHistory;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;

public class payHistoryDAO {
	private static payHistoryDAO nDAO;
	
	private payHistoryDAO(){
		
	}
	
	public static payHistoryDAO getInstance() {
		if(nDAO ==null) {
			nDAO=new payHistoryDAO();
			
		}
		return nDAO;
	}
	
	
	public int payHistoryTotalCnt(int num, RangeDTO rDTO) throws SQLException, IOException {
		int totalCnt = 0 ;
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectTotalCnt = new StringBuilder();
			selectTotalCnt
			.append("	SELECT count(*) cnt ")
			.append("	FROM (    ")
			.append("		SELECT	 ")
			.append("		p.pay_num AS pay_num,	 ")
			.append("		p.pay_date AS pay_date,	 ")
			.append("	t.ticket_name AS ticket_name,	 ")
			.append("	t.adult_price AS adult_price,	 ")
			.append("	t.teenager_price AS teenager_price,	 ")
			.append("	t.kids_price AS kids_price,	 ")
			.append("	SUM(CASE WHEN ps.personal_type = 1 THEN ps.personal_cnt ELSE 0 END) AS adult_cnt,	 ")
			.append("	SUM(CASE WHEN ps.personal_type = 2 THEN ps.personal_cnt ELSE 0 END) AS teenager_cnt,	 ")
			.append("	SUM(CASE WHEN ps.personal_type = 3 THEN ps.personal_cnt ELSE 0 END) AS kids_cnt,	 ")
			.append("	NVL(pr.discount, 1)  AS discount,	 ")
			.append("	CASE	 ")
			.append("	WHEN p.refund_state = 'Y' THEN 'Y'	 ")
			.append("	ELSE 'N' END AS state,	 ")
			.append("	ROW_NUMBER() OVER (ORDER BY p.pay_date DESC) AS RNUM	 ")
			.append("	FROM ticket_reserve tr	 ")
			.append("	JOIN pay p ON tr.t_res_num = p.t_res_num	 ")
			.append("	JOIN ticket t ON tr.ticket_num = t.ticket_num	 ")
			.append("	JOIN personal ps ON tr.t_res_num = ps.t_res_num	 ")
			.append("	LEFT JOIN promotion pr ON tr.prom_num = pr.prom_num	 ")
			.append("	WHERE tr.member_num = ?	 ");
			if(rDTO.getStartDate() !=null && !rDTO.getStartDate().isEmpty()) {
				if(rDTO.getEndDate() !=null && !rDTO.getEndDate().isEmpty()) {
			selectTotalCnt.append("	AND p.pay_date BETWEEN TO_DATE(?, 'YYYY-MM-DD')	 ")
			.append("	AND TO_DATE(?, 'YYYY-MM-DD')	 ");
				}//end if
			}//end if
			selectTotalCnt.append("	GROUP BY p.pay_num,p.pay_date,t.ticket_name,t.adult_price,t.teenager_price,t.kids_price,pr.discount,p.refund_state,tr.t_res_num)	 ");
			
			pstmt = con.prepareStatement(selectTotalCnt.toString());
			
			int pstmtNum=0;
			
			pstmt.setInt(++pstmtNum, num);
			if(rDTO.getStartDate()!=null && !rDTO.getStartDate().isEmpty()) {
				if(rDTO.getEndDate()!=null && !rDTO.getEndDate().isEmpty()) {
				pstmt.setString(++pstmtNum, rDTO.getStartDate());
				pstmt.setString(++pstmtNum, rDTO.getEndDate());
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
	}//payHistoryTotalCnt
	
	
	public List<payHistoryDTO> selectPayHistory(int num ,RangeDTO rDTO) throws SQLException, IOException {
		List<payHistoryDTO> list = new ArrayList<payHistoryDTO>();
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectpay = new StringBuilder();
			selectpay
			.append("	SELECT * ")
			.append("	FROM (    ")
			.append("		SELECT	 ")
			.append("		p.pay_num AS pay_num,	 ")
			.append("		p.pay_date AS pay_date,	 ")
			.append("	t.ticket_name AS ticket_name,	 ")
			.append("	t.adult_price AS adult_price,	 ")
			.append("	t.teenager_price AS teenager_price,	 ")
			.append("	t.kids_price AS kids_price,	 ")
			.append("	SUM(CASE WHEN ps.personal_type = 1 THEN ps.personal_cnt ELSE 0 END) AS adult_cnt,	 ")
			.append("	SUM(CASE WHEN ps.personal_type = 2 THEN ps.personal_cnt ELSE 0 END) AS teenager_cnt,	 ")
			.append("	SUM(CASE WHEN ps.personal_type = 3 THEN ps.personal_cnt ELSE 0 END) AS kids_cnt,	 ")
			.append("	NVL(pr.discount, 1)  AS discount,	 ")
			.append("	CASE	 ")
			.append("	WHEN p.refund_state = 'Y' THEN 'Y'	 ")
			.append("	ELSE 'N' END AS state, 	 ")
			.append("	ROW_NUMBER() OVER (ORDER BY p.pay_date DESC) AS RNUM	 ")
			.append("	FROM ticket_reserve tr	 ")
			.append("	JOIN pay p ON tr.t_res_num = p.t_res_num	 ")
			.append("	JOIN ticket t ON tr.ticket_num = t.ticket_num	 ")
			.append("	JOIN personal ps ON tr.t_res_num = ps.t_res_num	 ")
			.append("	LEFT JOIN promotion pr ON tr.prom_num = pr.prom_num	 ")
			.append("	WHERE tr.member_num = ?	 ");
			if(rDTO.getStartDate() !=null && !rDTO.getStartDate().isEmpty()) {
				if(rDTO.getEndDate() !=null && !rDTO.getEndDate().isEmpty()) {
					selectpay.append("	AND p.pay_date BETWEEN TO_DATE(?, 'YYYY-MM-DD')	 ")
			.append("	AND TO_DATE(?, 'YYYY-MM-DD')	 ");
				}//end if
			}//end if
			selectpay.append("	GROUP BY p.pay_num,p.pay_date,t.ticket_name,t.adult_price,t.teenager_price,t.kids_price,pr.discount,p.refund_state,tr.t_res_num)	 ")
			.append("	where rnum between ? and ?	");
			
			pstmt = con.prepareStatement( selectpay.toString());
			
			int pstmtNum=0;
			pstmt.setInt(++pstmtNum, num);
			if(rDTO.getStartDate() !=null && !rDTO.getStartDate().isEmpty()) {
				if(rDTO.getEndDate() !=null && !rDTO.getEndDate().isEmpty()) {
					pstmt.setString(++pstmtNum, rDTO.getStartDate());
					pstmt.setString(++pstmtNum, rDTO.getEndDate());
			}//end if
			}
			pstmt.setInt(++pstmtNum, rDTO.getStartNum());
			pstmt.setInt(++pstmtNum, rDTO.getEndNum());
			
			rs= pstmt.executeQuery();
			while(rs.next()) {
				payHistoryDTO rhDTO = new payHistoryDTO();
				rhDTO.setNum(rs.getInt("pay_num"));
				rhDTO.setPayDate(rs.getString("pay_date").substring(0,10));
				rhDTO.settName(rs.getString("ticket_name"));
				rhDTO.setAdultPrice(rs.getInt("adult_price"));
				rhDTO.setTeenPrice(rs.getInt("teenager_price"));
				rhDTO.setKidsprice(rs.getInt("kids_price"));
				rhDTO.setAdultCnt(rs.getInt("adult_cnt"));
				rhDTO.setTeenagerCnt(rs.getInt("teenager_cnt"));
				rhDTO.setKidsCnt(rs.getInt("kids_cnt"));
				rhDTO.setDiscount(rs.getInt("discount"));
				rhDTO.setState(rs.getString("state"));
				
				list.add(rhDTO);
			}//end while
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return list;
	}//selectReserve
	
	public payHistoryDTO payDetail(int payNum) throws SQLException, IOException {
		payHistoryDTO phDTO = new payHistoryDTO();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		
		try {
			con = db.getConn();
			
			StringBuilder selectpay = new StringBuilder();
			selectpay.append(" SELECT ")
			    .append("     p.pay_num AS pay_num, ")
			    .append("     p.pay_date AS pay_date, ")
			    .append("     t.ticket_name AS ticket_name, ")
			    .append("     t.adult_price AS adult_price, ")
			    .append("     t.teenager_price AS teenager_price, ")
			    .append("     t.kids_price AS kids_price, ")
			    .append("     SUM(CASE WHEN ps.personal_type = 1 THEN ps.personal_cnt ELSE 0 END) AS adult_cnt, ")
			    .append("     SUM(CASE WHEN ps.personal_type = 2 THEN ps.personal_cnt ELSE 0 END) AS teenager_cnt, ")
			    .append("     SUM(CASE WHEN ps.personal_type = 3 THEN ps.personal_cnt ELSE 0 END) AS kids_cnt, ")
			    .append("     NVL(pr.discount, 1) AS discount, ")
			    .append("     CASE WHEN p.refund_state = 'Y' THEN 'Y' ELSE 'N' END AS state, ")
			    .append("     pi.installment AS installment, ") // 1. 여기서 사용된 pi.installment가
			    .append("     ROW_NUMBER() OVER (ORDER BY p.pay_date DESC) AS RNUM ")
			    .append(" FROM ticket_reserve tr ")
			    .append(" JOIN pay p ON tr.t_res_num = p.t_res_num ")
			    .append(" JOIN pay_info pi ON p.pay_num = pi.pay_num ")
			    .append(" JOIN ticket t ON tr.ticket_num = t.ticket_num ")
			    .append(" JOIN personal ps ON tr.t_res_num = ps.t_res_num ")
			    .append(" LEFT JOIN promotion pr ON tr.prom_num = pr.prom_num ")
			    .append(" WHERE p.pay_num = ? ")
			    .append(" GROUP BY ")
			    .append("     p.pay_num, p.pay_date, t.ticket_name, t.adult_price, t.teenager_price, ")
			    .append("     t.kids_price, pr.discount, p.refund_state, tr.t_res_num, ")
			    .append("     pi.installment "); // 2. 여기에 반드시 추가되어야 합니다.
			pstmt = con.prepareStatement( selectpay.toString());
			
			pstmt.setInt(1, payNum);
			
			rs= pstmt.executeQuery();
			
			if(rs.next()) {
				phDTO.setNum(rs.getInt("pay_num"));
				phDTO.setPayDate(rs.getString("pay_date").substring(0,10));
				phDTO.settName(rs.getString("ticket_name"));
				phDTO.setAdultPrice(rs.getInt("adult_price"));
				phDTO.setTeenPrice(rs.getInt("teenager_price"));
				phDTO.setKidsprice(rs.getInt("kids_price"));
				phDTO.setAdultCnt(rs.getInt("adult_cnt"));
				phDTO.setTeenagerCnt(rs.getInt("teenager_cnt"));
				phDTO.setDiscount(rs.getInt("discount"));
				phDTO.setKidsCnt(rs.getInt("kids_cnt"));
				phDTO.setState(rs.getString("state"));
				phDTO.setInstallment(rs.getInt("installment"));
			}//end if
			
		}finally{
			db.dbClose(rs, pstmt, con);
		}//end finally
		return phDTO;
	}//selectNoticeDetail
	
}//class


