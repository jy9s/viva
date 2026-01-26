package kr.co.viva.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kr.co.sist.chipher.DataEncryption;
import kr.co.viva.notice.DbConn;

public class SearchDAO {

    private static SearchDAO sDAO;
    private DbConn db;

    private SearchDAO() {
        db = DbConn.getInstance("jdbc/dbcp");
    }

    public static SearchDAO getInstance() {
        if (sDAO == null) sDAO = new SearchDAO();
        return sDAO;
    }


    
    public SearchDTO selectLogin(SearchDTO dto) throws SQLException {
        SearchDTO result = null;

        String sql =
            "SELECT member_num, id, name " +
            "FROM member " +
            "WHERE id = ? AND pass = ? AND del_flag = 'N'";

        try (Connection con = db.getConn();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

        	pstmt.setString(1, dto.getId());
        	pstmt.setString(2, dto.getPass());


            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) {
                    result = new SearchDTO();
                    result.setMember_num(rs.getInt("member_num"));
                    result.setId(rs.getString("id"));
                    result.setName(rs.getString("name"));
                }
            }
        }

        return result;
    }


    // 아이디 찾기
    public String selectIdByBirthTel(SearchDTO dto) throws SQLException {
        String id = null;
        String sql = "SELECT id FROM member WHERE birth = ? AND tell = ?";

        try (Connection con = db.getConn();
             PreparedStatement pstmt = con.prepareStatement(sql)) {
        	
            pstmt.setDate(1, dto.getBirth());
            pstmt.setString(2, dto.getTel());

            try (ResultSet rs = pstmt.executeQuery()) {
                if (rs.next()) id = rs.getString("id");
            }
        }
        return id;
    }

    // 비번 변경 전 인증
    public boolean existsByIdTel(SearchDTO dto) throws SQLException {
        boolean ok = false;
        String sql = "SELECT 1 FROM member WHERE id = ? AND tell = ?";

        try (Connection con = db.getConn();
             PreparedStatement pstmt = con.prepareStatement(sql)) {

            pstmt.setString(1, dto.getId());
            pstmt.setString(2, dto.getTel());

            try (ResultSet rs = pstmt.executeQuery()) {
                ok = rs.next();
            }
        }
        return ok;
    }

    // 비번 변경
    public int updatePassword(SearchDTO dto) throws SQLException {
        String sql = "UPDATE member SET pass = ? WHERE id = ?";

        try (Connection con = db.getConn();
            PreparedStatement pstmt = con.prepareStatement(sql)) {

        	pstmt.setString(1, dto.getPass());
            pstmt.setString(2, dto.getId());

            return pstmt.executeUpdate();
        }
    }
}
