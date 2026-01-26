package attr;

import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;

public class AdminAttractionService {
	private static AdminAttractionService as;
	
	private AdminAttractionService() {
		
	}
	
	public static AdminAttractionService getInstance() {
		if(as==null) {
			as = new AdminAttractionService();
		}
		return as;
	}
	
	
	public List<AdminAttractionDTO> searchAttraction(String date, String attrName) {
		List<AdminAttractionDTO> list = null;
		AdminAttractionDAO aDAO = AdminAttractionDAO.getInstance();
		
		//날짜 없으면 디폴트 오늘 날짜.
		if(date==null || date.equals("")) {
			Date currentDate = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");        
	        date =  formatter.format(currentDate);
		}
		
		try {
			list = aDAO.selectAttraction(date, attrName);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return list;				
	}
	
	public AdminAttractionDTO searchDetailAttraction(String date, int num) {
		AdminAttractionDTO aDTO = null;
		//날짜 없으면 디폴트 오늘 날짜.
		if(date==null || date.equals("")) {
			Date currentDate = new Date();
			SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");        
	        date =  formatter.format(currentDate);
		}
		AdminAttractionDAO aDAO = AdminAttractionDAO.getInstance();
		try {
			aDTO = aDAO.selectDetailAttraction(date, num);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return aDTO;
	}
	
	
	public boolean modifyOperate(AdminAttractionDTO aDTO) {
		
		boolean flag=false;
		LocalDate startDate = LocalDate.parse(aDTO.getAttrStrDate());
		LocalDate endDate = LocalDate.parse(aDTO.getAttrEndDate());
		AdminAttractionDAO aDAO = AdminAttractionDAO.getInstance();
		if (startDate.isAfter(endDate)) {
			return flag;
		}

		try {
			flag = aDAO.updatePerform(aDTO);    
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
	
	
	
}
