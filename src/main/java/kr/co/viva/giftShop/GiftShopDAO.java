package kr.co.viva.giftShop;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;


public class GiftShopDAO {

	private static GiftShopDAO gsDAO;
	
	
	public static GiftShopDAO getInstance() {
		if(gsDAO==null) {
			
		gsDAO= new GiftShopDAO();
			
		}//end if
		return gsDAO;
	}//getInstance
	
	
	
	public List<GiftShopDTO> selectGiftShop() throws SQLException {
		GiftShopDTO gsDTO = new GiftShopDTO();
		List<GiftShopDTO> list = new ArrayList<GiftShopDTO>();
		
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try{
			con=db.getConn();
			StringBuilder selectGift = new StringBuilder();
			selectGift
	
			.append("	select GIFT_NUM, GIFT_NAME, GIFT_GOODS, GIFT_LOC,GIFT_PREVIEW		")
			.append("	from GIFTSHOP		");
			
			pstmt=con.prepareStatement(selectGift.toString());
			rs=pstmt.executeQuery();
			
			while(rs.next()) {
				gsDTO = new GiftShopDTO();
				gsDTO.setGiftNum(rs.getInt("GIFT_NUM"));
				gsDTO.setGiftName(rs.getString("GIFT_NAME"));
				gsDTO.setGiftGoods(rs.getString("GIFT_GOODS"));
				gsDTO.setGiftLoc(rs.getString("GIFT_LOC"));
				gsDTO.setGiftPrev(rs.getString("GIFT_PREVIEW"));
				
				list.add(gsDTO);
			}//end while
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}
		
		return list;
	}//selectGiftShop
	
	
	public GiftShopDTO selectGiftShopDtail(int GiftCode) throws SQLException {
		GiftShopDTO gsDTO = null;
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		try {
			
			con=db.getConn();
			StringBuilder selectGiftDetail = new StringBuilder();
			selectGiftDetail
			.append("		select GIFT_NAME, GIFT_OPER_TIME, GIFT_TEL, GIFT_GOODS, GIFT_EXPLIAN, GIFT_LOC,		")
			.append("		GIFT_LOC_IMG, GIFT_PREVIEW, GIFT_BACK_IMG		")
			.append("		from GIFTSHOP		")
			.append("		where GIFT_NUM=?		");
			
			
			pstmt = con.prepareStatement(selectGiftDetail.toString());
			
			pstmt.setInt(1, GiftCode);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				gsDTO = new GiftShopDTO();
				
				gsDTO.setGiftName(rs.getString("GIFT_NAME"));
				gsDTO.setGiftTime(rs.getString("GIFT_OPER_TIME"));
				gsDTO.setGitfTel(rs.getString("GIFT_TEL"));
				gsDTO.setGiftGoods(rs.getString("GIFT_GOODS"));
				gsDTO.setGiftExplain(rs.getString("GIFT_EXPLIAN"));
				gsDTO.setGiftLoc(rs.getString("GIFT_LOC"));
				gsDTO.setGiftLocImg(rs.getString("GIFT_LOC_IMG"));
				gsDTO.setGiftPrev(rs.getString("GIFT_PREVIEW"));
				gsDTO.setGiftBg(rs.getString("GIFT_BACK_IMG"));
				
				
			}//end if
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}//end finally
		

		
		return gsDTO;
		
	}//selectGiftShop
	
	
}//class
