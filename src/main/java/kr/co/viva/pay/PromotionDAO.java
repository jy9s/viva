package kr.co.viva.pay;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;

public class PromotionDAO {
	private static PromotionDAO instance;
	private PromotionDAO(){}
	
	public static PromotionDAO getInstance() {
	    if(instance == null){ instance = new PromotionDAO(); }
	    return instance;
	}
	
	public List<PromotionDTO> selectAllPromotion() throws SQLException {
	    List<PromotionDTO> list = new ArrayList<>();
	
	    DbConn dbCon = DbConn.getInstance("jdbc/dbcp");
	    Connection con = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;
	
	    try {
	        con = dbCon.getConn();
	        String sql = "SELECT prom_num, prom_pay_agency, discount FROM promotion";
	        pstmt = con.prepareStatement(sql);
	        rs = pstmt.executeQuery();
	
	        while(rs.next()) {
	            PromotionDTO dto = new PromotionDTO();
	            dto.setPromNum(rs.getInt("prom_num"));
	            dto.setPromPayAgency(rs.getString("prom_pay_agency")); // 신한, 국민, 우리, 삼성 등
	            dto.setDiscount(rs.getInt("discount"));                // 15, 20, ...
	              list.add(dto);
	            }
	        } finally {
	            dbCon.dbClose(rs, pstmt, con);
	        }
	        return list;
	    }
	}
