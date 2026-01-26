package kr.co.viva.operate;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class OperateService {
	
	private static OperateService os;
	
	private OperateService() {
		
		
	}
	
	public static OperateService getInstance() {
		if(os==null) {
			os=new OperateService();
			
		}//end if
		
		return os;

	}//getInstance
	
	
	public List<OperateServiceDTO> searchAtrraction(String OperDate){
		List<OperateServiceDTO> list = new ArrayList<OperateServiceDTO>();
		OperateServiceDAO osDAO = OperateServiceDAO.getInstance();
		
		try {
			list =osDAO.selectAtrraction(OperDate);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		
		return list;
	
	}//searchAtrraction

}//class
