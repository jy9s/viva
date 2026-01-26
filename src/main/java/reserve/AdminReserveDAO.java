package reserve;

import java.io.BufferedReader;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import db.DbConn;

public class AdminReserveDAO {
	private static AdminReserveDAO arDAO;
	
	private AdminReserveDAO() {
		
	}
	
	public static AdminReserveDAO getInstance() {
		
		if(arDAO==null) {
			arDAO = new AdminReserveDAO();
		}
		
		return arDAO;
	}
	
	public int selectReserveTotalCnt(ReserveRangeDTO rDTO, String table) throws SQLException {
		int totalCnt = 0;
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			//검색 키워드가 없다면 모든 글의 총 갯수를 검색.
			StringBuilder selectTotal = new StringBuilder();
			String temp=null;
			if(table.equals("ticket_reserve")) {
				
				temp = "	(select t.member_num, name, id, tell, t_res_num, t_res_state from member m "
						+ "right outer join ticket_reserve t on t.member_num = m.member_num)	";
			}else {
				temp = "   (select p.member_num, name, id, tell, p_res_person ,p_res_num, perf_schedule_num from member m "
						+ "right outer join perf_reserve p on p.member_num = m.member_num)	";
			}
			
			selectTotal.append("select count(*) cnt from ").append(temp);
			//dynamic query : 검색키워드가 있다면 검색 키워드에 해당하는 글의 갯수를 얻기
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				if(rDTO.getField().equals("1") && table.equals("ticket_reserve")) {
					selectTotal.append(" where	instr( t_");
				}else if(rDTO.getField().equals("1") && table.equals("perf_reserve")) {
					selectTotal.append(" where	instr( p_");
				}else {
					selectTotal.append(" where	instr(	");
				}
				selectTotal.append(rDTO.getFieldStr()).append(",?) ! = 0");				
			}//end if
			
			pstmt=con.prepareStatement(selectTotal.toString());			
		//5. 바인드 변수 값 설정
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(1, rDTO.getKeyword());
			}
			
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				totalCnt=rs.getInt("cnt");
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return totalCnt;
		
	}
	
	
	public List<AdminReserveDTO> selectRangeReserve(ReserveRangeDTO rDTO, String table) throws SQLException{
		List<AdminReserveDTO> list = new ArrayList<AdminReserveDTO>();
		
		DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1. JNDI 사용객체 생성
			//2. DataSource 얻기
			//3. Connection 얻기
			con = dbCon.getConn();
			//4. 쿼리문생성객체 얻기
			StringBuilder selectReserve = new StringBuilder();
			
			if(table.equals("perf_reserve")) {
				selectReserve
				.append("	select p_res_num, name, id, p_res_person,  pay_price,tell, pay_date, pay_method, refund_state from	")
				.append("	(select p.p_res_num, name, id, p_res_person,  pay_price,tell, pay_date, row_number() over(order by pay_date desc) rnum, pay_num, refund_state from	")
				.append("   (select p.member_num, name, id, tell, p_res_person ,p_res_num, perf_schedule_num from member m	")
				.append("	right outer join perf_reserve p on p.member_num = m.member_num) sub	")
				.append("	left outer join pay p on p.p_res_num = sub.p_res_num where pay_type = 2	"); 

			}else if(table.equals("ticket_reserve")) {
				selectReserve
				.append("	select sub.t_res_num, name, id,   total_personal_cnt, pay_price, tell, pay_date, pay_method, refund_state from	")
				.append("	(select sub.t_res_num, name, id,   total_personal_cnt, pay_price, tell, pay_date, row_number() over(order by pay_date desc) rnum, refund_state, pay_num from	")
				.append("	(select member_num, name, id, tell, sub.t_res_num, t_res_state, total_personal_cnt from	")
				.append("	(select t.member_num, name, id, tell, t_res_num, t_res_state from member m	")
				.append("	right outer join ticket_reserve t on m.member_num = t.member_num) sub	")
				.append("   right outer join (SELECT t_res_num, SUM(personal_cnt) AS total_personal_cnt FROM personal GROUP BY t_res_num) p on sub.t_res_num = p.t_res_num) sub		")
				.append("	right outer join pay p on sub.t_res_num=p.t_res_num where pay_type='1' 	");
			}
			
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				if(rDTO.getField().equals("1") && table.equals("ticket_reserve")) {
					selectReserve.append(" and	instr( sub.t_");
				}else if(rDTO.getField().equals("1") && table.equals("perf_reserve")) {
					selectReserve.append(" and	instr( sub.p_");
				}else {
					selectReserve.append(" and	instr(	");
				}
				selectReserve.append(rDTO.getFieldStr()).append(",?) ! = 0 ");				
			}
			selectReserve.append("	) sub	left join pay_info p on p.pay_num = sub.pay_num	where rnum between ? and ? order by pay_date desc	");

			
			
			pstmt = con.prepareStatement(selectReserve.toString());
			//5. 바인드 변수 값 설정
			int pstmtIdx=0;
			if(rDTO.getKeyword()!=null && !rDTO.getKeyword().isEmpty()) {
				pstmt.setString(++pstmtIdx, rDTO.getKeyword());
			}	
			pstmt.setInt(++pstmtIdx, rDTO.getStartNum());
			pstmt.setInt(++pstmtIdx, rDTO.getEndNum());
			
			
			AdminReserveDTO arDTO = null;
			rs=pstmt.executeQuery();			
			//6. 조회결과 얻기	
			while(rs.next()) {
				arDTO = new AdminReserveDTO();
				if(table.equals("ticket_reserve")) {
					arDTO.setResNum(rs.getInt("t_res_num"));
					arDTO.setResName(rs.getString("name"));
					arDTO.setResId(rs.getString("id"));
					arDTO.setResCount(rs.getInt("total_personal_cnt"));
					arDTO.setResPrice(rs.getInt("pay_price"));
					arDTO.setResTel(rs.getString("tell"));
					arDTO.setResPayDate(rs.getDate("pay_date"));
					arDTO.setResPayMethod(rs.getString("pay_method"));
					arDTO.setResRefund(rs.getString("refund_state"));
				}
				if(table.equals("perf_reserve")) {
					arDTO.setResNum(rs.getInt("p_res_num"));
					arDTO.setResName(rs.getString("name"));
					arDTO.setResId(rs.getString("id"));
					arDTO.setResCount(rs.getInt("p_res_person"));
					arDTO.setResPrice(rs.getInt("pay_price"));
					arDTO.setResTel(rs.getString("tell"));
					arDTO.setResPayDate(rs.getDate("pay_date"));
					arDTO.setResPayMethod(rs.getString("pay_method"));
					arDTO.setResRefund(rs.getString("refund_state"));
				}
				
				
				list.add(arDTO);
			}
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		
		
		return list;
		
	}
	
	public AdminReserveDTO selectReserveDetail(int num, String table) throws SQLException {
		AdminReserveDTO arDTO = null;
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder selectDetail = new StringBuilder();
			selectDetail.append("	select title, content, input_date, cnt, id ")
			.append("	from board	" )
			.append("	where num = ?	");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				arDTO= new AdminReserveDTO();
				
				//CLOB 처리문
				BufferedReader br = null;
				StringBuilder content = new StringBuilder();
				
				try {
					br = new BufferedReader(rs.getClob("Content").getCharacterStream());
					String readLine="";
					while((readLine=br.readLine())!=null) {
						content.append(readLine);
					}
					if(br != null) {br.close();};
					
				} catch (IOException e) {
					e.printStackTrace();
				} catch (NullPointerException nfe) {
					nfe.printStackTrace();
				}
				//arDTO.setContent(content.toString());
				//CLOB 처리문 끝
				
				
				
				
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return arDTO;
		
	}
	
	
	
	public int selectPayInfo(int num, String table) throws SQLException {
		int payNum = 0;
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder selectDetail = new StringBuilder();
			if(table.equals("perf_reserve")) {
				selectDetail.append("	select pay_num from pay where p_res_num = ? ");
			}else if(table.equals("ticket_reserve")) {
				selectDetail.append("	select pay_num from pay where t_res_num = ? ");
			}

		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				payNum = rs.getInt("pay_num");
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return payNum;
		
	}
	
	
	public AdminReserveDTO selectTicketDetail(int num) throws SQLException {
		AdminReserveDTO arDTO = new AdminReserveDTO();
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder selectDetail = new StringBuilder();
			selectDetail
			.append("	select pay_price, pay_date, sub.pay_num, pay_agency, pay_method, installment from	")
			.append("	(select t.t_res_num, pay_price, pay_date, pay_num from ticket_reserve t	")
			.append("	left join pay p on p.t_res_num= t.t_res_num where t.t_res_num=?) sub	")
			.append("	left join pay_info p on sub.pay_num = p.pay_num	");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
		//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				
				arDTO.setResPrice(rs.getInt("pay_price"));
				arDTO.setResPayDate(rs.getDate("pay_date"));
				arDTO.setResPayInfoNum(rs.getInt("pay_num"));
				arDTO.setResPayAgency(rs.getString("pay_agency"));
				arDTO.setResPayMethod(rs.getString("pay_method"));
				arDTO.setResInstallment(rs.getInt("installment"));								
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
			
		
		return arDTO;
		
	}
	public String selectTicketDetailName(int num) throws SQLException {
		String name=null;
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1. JNDI사용객체 생성		
			//2. DataSrouce 얻기			
			//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
			//4. 쿼리문 생성객체 얻기
			StringBuilder selectDetail = new StringBuilder();
			selectDetail
			.append("	select ticket_name from	")
			.append("	(select * from ticket_reserve where t_res_num= ? ) sub	")
			.append("	left join ticket t on t.ticket_num = sub.ticket_num	");
			
			
			//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
			//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("ticket_name");
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		
		
		return name;
		
	}
	
	
	public AdminReserveDTO selectPerfDetail(int num) throws SQLException {
		AdminReserveDTO arDTO = new AdminReserveDTO();
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1. JNDI사용객체 생성		
			//2. DataSrouce 얻기			
			//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
			//4. 쿼리문 생성객체 얻기
			StringBuilder selectDetail = new StringBuilder();
			selectDetail
			.append("	select pay_price, pay_date, sub.pay_num, pay_agency, pay_method, installment from	")
			.append("	(select t.p_res_num, pay_price, pay_date, pay_num from perf_reserve t	")
			.append("	left join pay p on p.p_res_num=t.p_res_num where t.p_res_num=?) sub	")
			.append("	left join pay_info p on sub.pay_num = p.pay_num	");
			
			
			//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
			//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				arDTO.setResPrice(rs.getInt("pay_price"));
				arDTO.setResPayDate(rs.getDate("pay_date"));
				arDTO.setResPayInfoNum(rs.getInt("pay_num"));
				arDTO.setResPayAgency(rs.getString("pay_agency"));
				arDTO.setResPayMethod(rs.getString("pay_method"));
				arDTO.setResInstallment(rs.getInt("installment"));								
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}

		return arDTO;
		
	}
	public String selectPerfDetailName(int num) throws SQLException {
		String name = null;
		
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			//1. JNDI사용객체 생성		
			//2. DataSrouce 얻기			
			//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
			//4. 쿼리문 생성객체 얻기
			StringBuilder selectDetail = new StringBuilder();
			selectDetail
			.append("	select perf_title from (select perf_num from	")
			.append("	(select * from perf_reserve where p_res_num= ? ) sub	")
			.append("	left join perf_schedule p on p.perf_schedule_num = sub.perf_schedule_num) sub	")
			.append("	left join performance p on p.perf_num = sub.perf_num	");
			
			
			//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(selectDetail.toString());
			pstmt.setInt(1, num);
			//6. 쿼리문 수행 후 결과 얻기
			rs=pstmt.executeQuery();
			if(rs.next()) {
				name = rs.getString("perf_title");
			}//end if
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(rs, pstmt, con);
		}
		
		return name;
		
	}
	
	
	
	
	
	
	public int updateReserve(int num) throws SQLException {
		int cnt = 0;
		DbConn dbCon=DbConn.getInstance("jdbc/dbcp");		
		
		Connection con = null;
		PreparedStatement pstmt = null;
		
		try {
		//1. JNDI사용객체 생성		
		//2. DataSrouce 얻기			
		//3. DataSource에서 Connection 얻기
			con=dbCon.getConn();
		//4. 쿼리문 생성객체 얻기
			StringBuilder updateBoard = new StringBuilder();
			updateBoard
			.append("	update	pay	")
			.append("	set		refund_state='Y'	")
			.append("	where	pay_num=?	");
			
			
		//5. 바인드 변수 값 설정
			pstmt=con.prepareStatement(updateBoard.toString());
			pstmt.setInt(1, num);
		//6. 쿼리문 수행 후 결과 얻기
			cnt=pstmt.executeUpdate();
			
		}finally {
			//7. 연결 끊기
			dbCon.dbClose(null, pstmt, con);
		}
		
		return cnt;
	}//update board

	
	
}
