package kr.co.viva.restaurant;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class RestaurantService {

	private static RestaurantService rs;
	
	private  RestaurantService() {
		
	}//FoodService
	
	public static RestaurantService getInstance() {
		if(rs==null) {
			
			rs=new RestaurantService();
		}//end if
		
		return rs;
		
	}//getInstance
	
	
	public List<RestaurantDTO> searchFood(){

		List<RestaurantDTO> list = new ArrayList<RestaurantDTO>();
		RestaurantDAO fDAO = RestaurantDAO.getInstance();
		
		
		try {
			list=fDAO.selectRestaurant();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchFood
	
	
	public RestaurantDTO searchFoodDetail(int restaurantCode) {
		
		RestaurantDAO fDAO = RestaurantDAO.getInstance();
		RestaurantDTO fDTO = null;
		
		try {
			fDTO=fDAO.selectRestaurantDetail(restaurantCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return fDTO;
	}//searchFoodDetail
	
	
}//class
