package kr.co.viva.perform;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;


public class UserPerformDAO {

    private static UserPerformDAO pDAO;
    private DbConn db;

    private UserPerformDAO() {
        db = DbConn.getInstance("jdbc/dbcp");
    }

    public static UserPerformDAO getInstance() {
        if (pDAO == null) {
            pDAO = new UserPerformDAO();
        }
        return pDAO;
    }
   
    private PerformDTO PerformDTO(ResultSet rs) throws SQLException {
        PerformDTO pDTO = new PerformDTO();
        pDTO.setPerfNum(rs.getInt("perf_num"));
        pDTO.setPerfTitle(rs.getString("perf_title"));
        pDTO.setPerfType(rs.getInt("perf_type"));
        pDTO.setPerfSubTitle(rs.getString("perf_sub_title"));
        pDTO.setPerfLoc(rs.getInt("perf_loc"));
        pDTO.setPerfStartDate(rs.getDate("perf_start_Date"));
        pDTO.setPerfEndDate(rs.getDate("perf_end_Date"));
        pDTO.setPerfTime(rs.getString("perf_time"));
        pDTO.setPerfShowTime(rs.getInt("perf_show_time"));
        pDTO.setPerfPrice(rs.getInt("perf_price"));
        pDTO.setPerfPreview(rs.getString("perf_preview"));
        pDTO.setPerfImg(rs.getString("perf_img"));
        pDTO.setPerfDelFlag(rs.getString("perf_del_flag"));
        pDTO.setPerfInputDate(rs.getDate("perf_input_date"));
        return pDTO;
    }

    private PerformReserveDTO PerformReserveDTO(ResultSet rs) throws SQLException {
    	PerformReserveDTO prDTO = new PerformReserveDTO();
    	prDTO.setpResName(rs.getString("p_res_name"));
    	prDTO.setpResNum(rs.getInt("p_res_num"));
    	prDTO.setpResPerson(rs.getInt("p_res_person"));         
    	prDTO.setpResState(rs.getString("p_res_state"));
    	prDTO.setpResDate(rs.getDate("p_res_date"));
    	prDTO.setPerfDate(rs.getDate("perf_date"));
    	prDTO.setPayPrice(rs.getInt("pay_price"));
    	prDTO.setPayMethod(rs.getString("pay_method"));
    	prDTO.setInstallment(rs.getInt("installment"));
        return prDTO;
    }


    // 전체 공연/퍼레이드 목록 확완
    public List<PerformDTO> selectUserPerform() throws SQLException {
    	
        List<PerformDTO> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT perf_num, perf_title, perf_type, perf_sub_title,"
                   + "       perf_loc, perf_start_date, perf_end_date,"
                   + "       perf_time, perf_show_time, perf_price,"
                   + "       perf_preview, perf_img, perf_del_flag, perf_input_date"
                   + "  FROM performance"
                   + " WHERE perf_del_flag = 'N'"
                   + " ORDER BY perf_start_date";

        try {
            con = db.getConn();
            pstmt = con.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(PerformDTO(rs));
            }

        } finally {
            db.dbClose(rs, pstmt, con);
        }

        return list;
    }
    
    
    public int selectTotalCount(String filter) throws SQLException {
        StringBuilder sql = new StringBuilder("SELECT COUNT(*) cnt FROM performance");
        boolean hasType = filter != null && !"all".equals(filter);

        if(hasType){
            sql.append(" WHERE perf_type = ?");
        }

        try(Connection con = db.getConn();
            PreparedStatement pstmt = con.prepareStatement(sql.toString())){

            if(hasType){
                pstmt.setInt(1, Integer.parseInt(filter)); // 1 or 2
            }

            try(ResultSet rs = pstmt.executeQuery()){
                rs.next();
                return rs.getInt("cnt");
            }
        }
    }


    public List<PerformDTO> selectPerformListPaging(String filter, int startNum, int endNum) throws SQLException {
        List<PerformDTO> list = new ArrayList<>();
        boolean hasType = filter != null && !"all".equals(filter);

        StringBuilder sql = new StringBuilder();
        sql.append("SELECT * FROM ( ");
        sql.append("  SELECT p.*, ROW_NUMBER() OVER(ORDER BY perf_num DESC) rnum ");
        sql.append("  FROM performance p ");
        sql.append("  WHERE p.perf_del_flag = 'N' ");
        if (hasType) {
            sql.append("  AND p.perf_type = ? ");
        }
        sql.append(") WHERE rnum BETWEEN ? AND ?");

        try(Connection con = db.getConn();
            PreparedStatement pstmt = con.prepareStatement(sql.toString())){

            int idx = 1;
            if(hasType){
                pstmt.setInt(idx++, Integer.parseInt(filter)); // 1 or 2
            }
            pstmt.setInt(idx++, startNum);
            pstmt.setInt(idx++, endNum);

            try(ResultSet rs = pstmt.executeQuery()){
                while(rs.next()){
                    PerformDTO dto = new PerformDTO();
                    dto.setPerfNum(rs.getInt("perf_num"));
                    dto.setPerfTitle(rs.getString("perf_title"));
                    dto.setPerfSubTitle(rs.getString("perf_sub_title"));
                    dto.setPerfType(rs.getInt("perf_type"));
                    dto.setPerfImg(rs.getString("perf_img"));
                    list.add(dto);
                }
            }
        }
        return list;
    }



    // 타입별 목록  확완
    public List<PerformDTO> selectUserPerform(int perfType) throws SQLException {
        List<PerformDTO> list = new ArrayList<>();

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "SELECT perf_num, perf_title, perf_type, perf_sub_title,"
                   + "       perf_loc, perf_start_date, perf_end_date,"
                   + "       perf_time, perf_show_time, perf_price,"
                   + "       perf_preview, perf_img, perf_del_flag, perf_input_date"
                   + "  FROM performance"
                   + " WHERE perf_del_flag = 'N'"
                   + "   AND perf_type = ?"
                   + " ORDER BY perf_start_date";

        try {
            con = db.getConn();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, perfType);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                list.add(PerformDTO(rs));
            }

        } finally {
            db.dbClose(rs, pstmt, con);
        }

        return list;
    }

    // 공연 상세 확완
    public PerformDTO selectDetailPerform(int perfNum) throws SQLException {
        PerformDTO pdto = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = "	SELECT perf_num, perf_title, perf_type, perf_sub_title,	"
                   + "       perf_loc, perf_start_date, perf_end_date,	"
                   + "       perf_time, perf_show_time, perf_price,"
                   + "       perf_preview, perf_img, perf_del_flag, perf_input_date	"
                   + "  FROM performance"
                   + " WHERE perf_num = ?";

        try {
            con = db.getConn();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, perfNum);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                pdto = PerformDTO(rs);
            }

        } finally {
            db.dbClose(rs, pstmt, con);
        }

        return pdto;
    }

    //예약용 상세 확완
    public PerformReserveDTO selectMemberReserveDetail(int memberNum) throws SQLException {
        PerformReserveDTO prdto = null;

        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String sql = " select r.p_res_num, s.perf_num, r.member_num, "
                   + " s.perf_date, r.p_res_person, r.p_res_state,"
                   + " f.perf_title, r.p_res_date, r.p_res_name, f.perf_loc "
                   + "       ,p.pay_price, " 
                   + "       pi.pay_method, pi.installment " 
                   + " from perf_reserve r "
                   + " join pay p "
                   + " on r.p_res_num = p.p_res_num "
			       + " join perf_schedule s "
			       + " on r.perf_schedule_num = s.perf_schedule_num "
			       + " join performance f "
			       + " on f.perf_num = s.perf_num "
			       + " join pay_info pi "
			       + " on p.pay_num = pi.pay_num "
			       
			  
			       + " where r.member_num = ? ";

        try {
            con = db.getConn();
            pstmt = con.prepareStatement(sql);
            pstmt.setInt(1, memberNum);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                prdto = PerformReserveDTO(rs);
            }

        } finally {
            db.dbClose(rs, pstmt, con);
        }

        return prdto;
    }

    
    //예약 insert
    public int insertPerfReserve(PerformReserveDTO prDTO) throws SQLException {

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        int cnt = 0;
        int payNum = 0;

        try {
            con = db.getConn();
            con.setAutoCommit(false);

            String sqlSchedule =
                "INSERT INTO perf_schedule (perf_schedule_num, perf_num, perf_date) " +
                "VALUES (SEQ_P_SCHEDULE_NUM.NEXTVAL, ?, ?)";

            ps = con.prepareStatement(sqlSchedule);
            ps.setInt(1, prDTO.getPerfNum());
            ps.setDate(2, prDTO.getPerfDate());
            ps.executeUpdate();
            ps.close();

            String sqlReserve =
                "INSERT INTO perf_reserve (p_res_num, perf_schedule_num, member_num,p_res_name, p_res_person, p_res_date) " +
                "VALUES (SEQ_P_RES_NUM.NEXTVAL, SEQ_P_SCHEDULE_NUM.CURRVAL,?, ?, ?, SYSDATE)";

            ps = con.prepareStatement(sqlReserve);
            ps.setInt(1, prDTO.getMember_num());
            ps.setString(2, prDTO.getpResName());
            ps.setInt(3, prDTO.getpResPerson());
            cnt = ps.executeUpdate();
            
            PreparedStatement psKey = null;

            psKey = con.prepareStatement("SELECT SEQ_P_RES_NUM.CURRVAL FROM dual");
            rs = psKey.executeQuery();
            if(rs.next()){
                prDTO.setpResNum(rs.getInt(1));
            }
            rs.close();
            psKey.close();

            
            ps.close();

            ps = con.prepareStatement("SELECT SEQ_PAY_NUM.NEXTVAL FROM dual");
            rs = ps.executeQuery();
            if (rs.next()) payNum = rs.getInt(1);
            rs.close();
            ps.close();

            String sqlPay =
                "INSERT INTO pay (pay_num, p_res_num,pay_type, pay_price, pay_date) " +
                "VALUES (?, SEQ_P_RES_NUM.CURRVAL,2, ?, SYSDATE)";

            ps = con.prepareStatement(sqlPay);
            ps.setInt(1, payNum);
            ps.setInt(2, prDTO.getPayPrice());
            ps.executeUpdate();
            ps.close();

            String sqlPayInfo =
                "INSERT INTO pay_info (payinfo_num, pay_num, pay_agency, pay_method, cvc, expiration, card_pass, " +
                "card_num1, card_num2, card_num3, card_num4, installment) " +
                "VALUES (SEQ_PAYINFO_NUM.NEXTVAL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

            ps = con.prepareStatement(sqlPayInfo);
            ps.setInt(1, payNum);
            ps.setString(2, prDTO.getPayAgency());
            ps.setString(3, prDTO.getPayMethod());
            ps.setString(4, prDTO.getCvc());
            ps.setString(5, prDTO.getExpiration());
            ps.setInt(6, prDTO.getCardPass());
            ps.setString(7, prDTO.getCardNum1());
            ps.setString(8, prDTO.getCardNum2());
            ps.setString(9, prDTO.getCardNum3());
            ps.setString(10, prDTO.getCardNum4());
            ps.setInt(11, prDTO.getInstallment());
            ps.executeUpdate();

            con.commit();
            return cnt;

        } catch (SQLException e) {
            if (con != null) con.rollback();
            throw e;
        } finally {
            if (rs != null) rs.close();
            if (ps != null) ps.close();
            if (con != null) con.close();
        }
    }


    
  }	

