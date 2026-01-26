package kr.co.viva.pay;

import java.sql.Connection;
import java.sql.SQLException;

import kr.co.viva.notice.DbConn;



public class PayProcessService {


	public boolean process(PayInfoDTO payDto, ResInfoDTO resDto, PersonalDTO pDTO , String qrFileName ) throws SQLException {


		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		Connection con = null;

		try {
		con = dbCon.getConn();
		con.setAutoCommit(false);
		
		
		PayProcessDAO dao = PayProcessDAO.getInstance();
		
		//1.티켓예매
		int tResNum = dao.insertTicketReserve(con, resDto, qrFileName);
		//2.구매정보
		int payNum = dao.insertPay(con, tResNum, resDto.getTotalPrice());
		//3.결제정보
		dao.insertPayInfo(con, payNum, payDto);
		//4.일반 혹은 연간 티켓
		if(resDto.isAnnual()) {
		    dao.insertAnnTicket(con, tResNum);
		} else {
			dao.insertNormalTicket(con, tResNum, resDto.getUseDate());
		}
		
		//5.인원정보
		if(resDto.getAdultCnt() > 0) {
		    dao.insertPersonal(con,
		        new PersonalDTO(1, resDto.getAdultCnt()), tResNum);
		}

		if(resDto.getTeenAgerCnt() > 0) {
		    dao.insertPersonal(con,
		        new PersonalDTO(2, resDto.getTeenAgerCnt()), tResNum);
		}

		if(resDto.getKidsCnt() > 0) {
		    dao.insertPersonal(con,
		        new PersonalDTO(3, resDto.getKidsCnt()), tResNum);
		}
		
		
		con.commit();
		return true;
		
		
		} catch(Exception e) {
			
		try { if(con != null) con.rollback(); }
			catch(Exception ex) { ex.printStackTrace(); }
		e.printStackTrace();
		
		return false;
		
		} finally {
			// 모두 닫는다.
			dbCon.dbClose(null, null, con);
		}
		}// SQLException
	
	
}//class