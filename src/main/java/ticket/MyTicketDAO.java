package ticket;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import db.DbConn;

public class MyTicketDAO {
    private static MyTicketDAO mtDAO;

    private MyTicketDAO() {}

    public static MyTicketDAO getInstance() {
        if (mtDAO == null) {
            mtDAO = new MyTicketDAO();
        }
        return mtDAO;
    }

    // 전체 티켓 조회
    public List<MyTicketDTO> selectTicket(int memberNum) throws SQLException {
        List<MyTicketDTO> list = new ArrayList<>();
        
        DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = dbCon.getConn();

            StringBuilder selectTicket = new StringBuilder();
            selectTicket
            .append("SELECT t.t_res_num, ")
            .append("       MAX(CASE WHEN p.personal_type=1 THEN tt.ticket_name END) AS adult_ticket, ")
            .append("       MAX(CASE WHEN p.personal_type=2 THEN tt.ticket_name END) AS teen_ticket, ")
            .append("       MAX(CASE WHEN p.personal_type=3 THEN tt.ticket_name END) AS child_ticket, ")
            .append("       SUM(CASE WHEN p.personal_type=1 THEN p.personal_cnt ELSE 0 END) AS adult_count, ")
            .append("       SUM(CASE WHEN p.personal_type=2 THEN p.personal_cnt ELSE 0 END) AS teen_count, ")
            .append("       SUM(CASE WHEN p.personal_type=3 THEN p.personal_cnt ELSE 0 END) AS child_count, ")
            .append("       MAX(pi.pay_method) AS pay_method, ")
            .append("       MAX(n.use_date) AS use_date, ")
            .append("       MAX(t.ticket_qr) AS ticket_qr, ")
            .append("       MAX(t.t_res_date) AS t_res_date ")
            .append("FROM ticket_reserve t ")
            .append("JOIN ticket tt ON t.ticket_num = tt.ticket_num ")
            .append("LEFT JOIN personal p ON t.t_res_num = p.t_res_num ")
            .append("LEFT JOIN normal_ticket n ON t.t_res_num = n.t_res_num ")
            .append("LEFT JOIN pay pay ON t.t_res_num = pay.t_res_num ")
            .append("LEFT JOIN pay_info pi ON pay.pay_num = pi.pay_num ")
            .append("WHERE t.member_num = ? AND (pay.refund_state IS NULL OR pay.refund_state='N') ") // 환불 티켓 제외
            .append("GROUP BY t.t_res_num ")
            .append("ORDER BY MAX(t.t_res_date) DESC");

            pstmt = con.prepareStatement(selectTicket.toString());
            pstmt.setInt(1, memberNum);
            rs = pstmt.executeQuery();

            while (rs.next()) {
                MyTicketDTO dto = new MyTicketDTO(
                    rs.getInt("t_res_num"),
                    rs.getString("adult_ticket"),
                    String.valueOf(rs.getInt("adult_count")),
                    rs.getString("pay_method"),
                    rs.getString("ticket_qr"),
                    rs.getDate("use_date"),
                    rs.getDate("t_res_date"),
                    rs.getString("adult_ticket"),
                    rs.getString("teen_ticket"),
                    rs.getString("child_ticket"),
                    rs.getInt("adult_count"),
                    rs.getInt("teen_count"),
                    rs.getInt("child_count")
                );
                list.add(dto);
            }

        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }

        return list;
    }

    // 티켓 상세 조회
    public MyTicketDTO selectTicketDetail(int memberNum, int ticketNum) throws SQLException {

        MyTicketDTO mtDTO = null;

        DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            con = dbCon.getConn();

            StringBuilder stDetail = new StringBuilder();
            stDetail
                .append("SELECT t.t_res_num, ")
                .append("       tt.ticket_name, ")  // 모든 타입 공용 티켓 이름
                .append("       SUM(CASE WHEN p.personal_type=1 THEN p.personal_cnt ELSE 0 END) AS adult_count, ")
                .append("       SUM(CASE WHEN p.personal_type=2 THEN p.personal_cnt ELSE 0 END) AS teen_count, ")
                .append("       SUM(CASE WHEN p.personal_type=3 THEN p.personal_cnt ELSE 0 END) AS child_count, ")
                .append("       MAX(pi.pay_method) AS pay_method, ")
                .append("       MAX(n.use_date) AS use_date, ")
                .append("       MAX(t.ticket_qr) AS ticket_qr, ")
                .append("       MAX(t.t_res_date) AS t_res_date ")
                .append("FROM ticket_reserve t ")
                .append("JOIN ticket tt ON t.ticket_num = tt.ticket_num ")
                .append("LEFT JOIN personal p ON t.t_res_num = p.t_res_num ")
                .append("LEFT JOIN normal_ticket n ON t.t_res_num = n.t_res_num ")
                .append("LEFT JOIN pay pay ON t.t_res_num = pay.t_res_num ")
                .append("LEFT JOIN pay_info pi ON pay.pay_num = pi.pay_num ")
                .append("WHERE t.member_num = ? AND t.t_res_num = ? ")
                .append("GROUP BY t.t_res_num, tt.ticket_name");  // 이름을 GROUP BY에 추가

            pstmt = con.prepareStatement(stDetail.toString());
            pstmt.setInt(1, memberNum);
            pstmt.setInt(2, ticketNum);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                mtDTO = new MyTicketDTO(
                    rs.getInt("t_res_num"),
                    rs.getString("ticket_name"),                     // 티켓 이름
                    String.valueOf(rs.getInt("adult_count")),       // 성인 수
                    rs.getString("pay_method"),
                    rs.getString("ticket_qr"),
                    rs.getDate("use_date"),
                    rs.getDate("t_res_date"),
                    rs.getString("ticket_name"),                     // adultTicket (성인/청소년/어린이 공용)
                    rs.getString("ticket_name"),                     // teenTicket
                    rs.getString("ticket_name"),                     // childTicket
                    rs.getInt("adult_count"),
                    rs.getInt("teen_count"),
                    rs.getInt("child_count")
                );
            }

        } finally {
            dbCon.dbClose(rs, pstmt, con);
        }

        return mtDTO;
    }

    // 환불 처리
    public int updateTicket(int tResNum) throws SQLException {
        int cnt = 0;
        DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
        Connection con = null;
        PreparedStatement pstmt = null;

        try {
            con = dbCon.getConn();
            StringBuilder sql = new StringBuilder();
            sql.append("UPDATE pay ")
               .append("SET refund_state = 'Y' ")
               .append("WHERE t_res_num = ?");

            pstmt = con.prepareStatement(sql.toString());
            pstmt.setInt(1, tResNum);
            cnt = pstmt.executeUpdate();
        } finally {
            dbCon.dbClose(null, pstmt, con);
        }
        System.out.println(tResNum);
        return cnt;
    }

}