package kr.co.viva.restaurant;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import kr.co.viva.notice.DbConn;


public class RestaurantDAO {

	private static RestaurantDAO fDAO;

	public RestaurantDAO() {
		
	}//FoodDAO
	
	public static RestaurantDAO getInstance() {
		if(fDAO==null) {
			fDAO=new RestaurantDAO();
		}//end if 
		
		
		return fDAO;
		
	}//getInstance
	
	public List<RestaurantDTO> selectRestaurant() throws SQLException {
		RestaurantDTO fDTO =null;
		List<RestaurantDTO> list = new ArrayList<RestaurantDTO>();
		
		DbConn db = DbConn.getInstance("jdbc/dbcp");
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		
		try {
			
			con=db.getConn();
			StringBuilder selectFood = new StringBuilder();
			//id,name, goods, loc
			selectFood
			.append("	select RSTR_NUM,RSTR_NAME,RSTR_GOODS,RSTR_LOC,RSTR_PREVIEW		")
			.append("	from restaurant		");
			
			pstmt = con.prepareStatement(selectFood.toString());
			rs=pstmt.executeQuery();
		
			while(rs.next()) {
				fDTO=new RestaurantDTO();
				fDTO.setRestaurantNum(rs.getInt("RSTR_NUM"));
				fDTO.setRestaurantName(rs.getString("RSTR_NAME"));
				fDTO.setRestaurantGoods(rs.getString("RSTR_GOODS"));
				fDTO.setRestaurantLoc(rs.getString("RSTR_LOC"));
				fDTO.setRestaurantPerv(rs.getString("RSTR_PREVIEW"));
				
				
				list.add(fDTO);
			}//end while
			
		}finally {
			db.dbClose(rs, pstmt, con);
		}//end finally
		
		
		
		return list;
		
	}//selectFood
	
	
	public RestaurantDTO selectRestaurantDetail(int restaurantNum) throws SQLException {
			RestaurantDTO fDTO=null;
		
			DbConn db = DbConn.getInstance("jdbc/dbcp");
			
			Connection con =null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			
			try {
				
			
			con=db.getConn();
			
			StringBuilder DetailFood = new StringBuilder();
			DetailFood
			.append("	select RSTR_NAME, RSTR_OPER_TIME, RSTR_TYPE, RSTR_PRICE, RSTR_EXPLIAN, 		")
			.append("	RSTR_GOODS, RSTR_LOC, RSTR_LOC_IMG, RSTR_BACK_IMG		")
			.append("	from restaurant		")
			.append("	where RSTR_NUM=?		");
			
			pstmt=con.prepareStatement(DetailFood.toString() );
			
			pstmt.setInt(1,restaurantNum);
			
			rs=pstmt.executeQuery();
			
			if(rs.next()) {
				
				fDTO=new RestaurantDTO();
				fDTO.setRestaurantName(rs.getString("RSTR_NAME"));
				fDTO.setRestaurantOperTime(rs.getString("RSTR_OPER_TIME"));
				fDTO.setRestaurantType(rs.getInt("RSTR_TYPE"));
				fDTO.setRestaurantPrice(rs.getString("RSTR_PRICE"));
				fDTO.setRestaurantExpian(rs.getString("RSTR_EXPLIAN"));
				fDTO.setRestaurantGoods(rs.getString("RSTR_GOODS"));
				fDTO.setRestaurantLoc(rs.getString("RSTR_LOC"));
				fDTO.setRestaurantLocImg(rs.getString("RSTR_LOC_IMG"));
				fDTO.setRestaurantBg(rs.getString("RSTR_BACK_IMG"));
				
			}//end if
			
			}finally {
				
				db.dbClose(rs, pstmt, con);
			}//end finally
			
			
			return fDTO;
	}//selectFoodDetail 
	
	
}//class
