package kr.co.viva.pay;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Date;




public class PayProcessDAO {

    private static PayProcessDAO pDAO;
	
	private PayProcessDAO(){
	}


	public static PayProcessDAO getInstance() {
	    if (pDAO == null) {
	        pDAO = new PayProcessDAO();
	    }
	    return pDAO;
	}


	/* ==================================================
	* 1️. 예매 생성 (ticket_reserve)
	* ==================================================*/
	public int insertTicketReserve(Connection con, ResInfoDTO dto,String qrFileName) throws SQLException {
	
	
	String sql = "INSERT INTO ticket_reserve "
	+ "(t_res_num, member_num, t_res_date, t_res_state, ticket_num, prom_num ,ticket_qr) "
	+ "VALUES (seq_t_res_num.NEXTVAL, ?, SYSDATE, 'Y', ?, ?,?)";
	
	//추가되는 seq 값을 저장해서 다른 테이블에 연결키로 넣는다. 
	String seqSql = "SELECT seq_t_res_num.CURRVAL FROM dual";
	
	
	int ticketNum=101;
	if (dto.isAnnual()) {
	    ticketNum = 100; // 연간권
	} else {
	    ticketNum = 101; // 당일권
	}
	
	
	try(
		PreparedStatement ps = con.prepareStatement(sql)) {
			ps.setInt(1, dto.getMemberNum());                       // dto.getMemberNum()); // member 테이블의 회원번호 PK를 불러서 넣어야 함 
			ps.setInt(2, ticketNum);               // dto.getTicketNum()); // ticket 테이블의 키값 100, 101 두 종류가 있음.
			ps.setInt(3, dto.getProm_num());       // dto.getProm_num());  // 프로모션 번호
			ps.setString(4, qrFileName);       
			
			System.out.print(dto.getProm_num());
			
			ps.executeUpdate();
			
			
		}
	
	
	try(
		PreparedStatement ps = con.prepareStatement(seqSql);
			ResultSet rs = ps.executeQuery())  {
			rs.next();
			return rs.getInt(1);
		}
	
	}//insertTicketReserve



	/* ==================================================
	* 2️. 결제 생성 (pay)
	* ==================================================*/
	public int insertPay(Connection con, int tResNum, int payPrice) throws SQLException {
	
	
	String sql = "INSERT INTO pay "
	+ "(pay_num, pay_type, pay_date, pay_price, refund_state, t_res_num) "
	+ "VALUES (seq_pay_num.NEXTVAL, '1', SYSDATE, ?, 'N', ?)";
	
	
	String seqSql = "SELECT seq_pay_num.CURRVAL FROM dual";
	
	
	try(
			PreparedStatement ps = con.prepareStatement(sql)){
			ps.setInt(1, payPrice);
			ps.setInt(2, tResNum);
			ps.executeUpdate();
		}	
	
	
	try(
			PreparedStatement ps = con.prepareStatement(seqSql);
			ResultSet rs = ps.executeQuery()){
			rs.next();
			return rs.getInt(1);
		}
	
	}//insertPay	
	

	/* ==================================================
	* 3️. 결제 상세 (pay_info)
	* ==================================================*/
	public void insertPayInfo(Connection con, int payNum, PayInfoDTO dto) throws SQLException {


	String sql = "INSERT INTO pay_info "
	+ "(payinfo_num, pay_num, card_num1, card_num2, card_num3, card_num4, "
	+ " cvc, expiration, card_pass, installment, pay_agency, pay_method) "
	+ "VALUES (seq_payinfo_num.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";


	try(
		PreparedStatement ps = con.prepareStatement(sql)){
			ps.setInt(1, payNum);
			ps.setInt(2, dto.getCardNum1());
			ps.setInt(3, dto.getCardNum2());
			ps.setInt(4, dto.getCardNum3());
			ps.setInt(5, dto.getCardNum4());
			ps.setInt(6, dto.getCvc());
			ps.setString(7, dto.getExpiration());
			ps.setInt(8, dto.getCardPass());
			ps.setInt(9, dto.getInstallment());
			ps.setString(10, dto.getPayAgency());
			ps.setString(11, "신용카드");
			ps.executeUpdate();
		}
	
	}//insertPayInfo


	/* ==================================================
	* 4️. 일반권 등록 (normal_ticket)
	* ==================================================*/
	public void insertNormalTicket(Connection con, int tResNum, Date useDate) throws SQLException {

	String sql = "INSERT INTO normal_ticket "
	+ "(t_res_num, use_date, normal_is_use) "
	+ "VALUES (?, ?, 'N')";

	try(
		PreparedStatement ps = con.prepareStatement(sql)){
			ps.setInt(1, tResNum);
			ps.setDate(2, new java.sql.Date(useDate.getTime()));
			ps.executeUpdate();
		}
	
	} //insertNormalTicket
	
	/* ==================================================
	* 5️. 연간권 등록 (normal_ticket)
	* ==================================================*/
	public int insertAnnTicket(Connection con, int tResNum) throws SQLException {

	    String sql = " INSERT INTO ann_ticket (t_res_num, use_start_date, use_end_date, ann_is_use) "
	    		       + " VALUES (?, SYSDATE, ADD_MONTHS(SYSDATE, 12), 'N')";

	    try (
	    		PreparedStatement ps = con.prepareStatement(sql)) {
		        ps.setInt(1, tResNum);
		        return ps.executeUpdate();
	    		}
	    
	} // insertAnnTicket

	
	/* ==================================================
	* 6️. 인원정보 
	* ==================================================*/

	public int insertPersonal(Connection con, PersonalDTO dto, int tResNum) throws SQLException {

	    String sql = " INSERT INTO personal (t_res_num, personal_type, personal_cnt)  VALUES (?, ?, ?) ";

	    try (
	    		PreparedStatement ps = con.prepareStatement(sql)) {
		        ps.setInt(1, tResNum);
		        ps.setInt(2, dto.getPersonalType()); // 1:성인, 2:청소년, 3:어린이
		        ps.setInt(3, dto.getPersonalCnt());
		        return ps.executeUpdate();
	    		}
	    
	}//insertPersonal

	
}// class