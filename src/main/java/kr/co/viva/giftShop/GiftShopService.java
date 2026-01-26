package kr.co.viva.giftShop;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class GiftShopService {
	
	private static GiftShopService gs;
	
	private GiftShopService() {
		
	}
	
	public static GiftShopService getInstance() {
		if(gs==null) {
			gs=new GiftShopService();
			
		}//end if 
		
		return gs;
		
	}//getInstance

	
	public List<GiftShopDTO> searchGiftShop() {
		List<GiftShopDTO> list = new ArrayList<GiftShopDTO>();
		GiftShopDAO gsDAO = new GiftShopDAO();
		
		try {
			list=gsDAO.selectGiftShop();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
			
		return list;
		
	}//searchGiftShop\
	
	
	public GiftShopDTO searchGiftShopDetail(int giftCode) {
		GiftShopDAO gsDAO =new GiftShopDAO();
		GiftShopDTO gsDTO=null;
		
		try {
			
			gsDTO = gsDAO.selectGiftShopDtail(giftCode);
		}catch (SQLException se) {
			se.printStackTrace();
		
		}
		
	
		return gsDTO;
	}//searchGiftShopDetail
}//class
