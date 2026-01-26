package kr.co.viva.attr;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class AttractionService {
	
	
	private static AttractionService as;

	
	private AttractionService() {}
	
	public static AttractionService getInstance() {
		if(as==null) {
			as=new AttractionService();
			
		}//end if 
	
		
		return as;
	}//getInstance
	
	public List<AttractionDTO> searchAttraction() {
		List<AttractionDTO> list = 	new ArrayList<AttractionDTO>();
		AttractionDAO atDAO = AttractionDAO.getInstance();
		
		try {
			list=atDAO.selectAttrac();
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return list;
	}//searchAttraction
	
	
	public AttractionDTO searchAttracDetail(int AttractionCode){
		
		AttractionDAO aDAO = AttractionDAO.getInstance();
		AttractionDTO aDTO =null;
		try {
			aDTO = aDAO.searchAttracDetail(AttractionCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
		
		return aDTO;
		
		
	}//searchAttracDetail
	
	
	public List<AttractionDTO> searchAttracOperate(int AttractionCode) {
		AttractionDAO aDAO = AttractionDAO.getInstance();
		List<AttractionDTO> operate = new ArrayList<AttractionDTO>();
		
		try {
			operate=aDAO.searchOperate(AttractionCode);
		} catch (SQLException e) {
			e.printStackTrace();
		}//end catch
					
		return operate;
		
	}//searchAttracOperate
	
}//class
