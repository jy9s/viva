package kr.co.viva.mypage;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MypageService {
	private static MypageService ms;
	
	private MypageService() {
		
	}
	
	public static MypageService getInstance() {
		if(ms==null) {
			ms = new MypageService();
			
		}
		return ms;
	}
	
	public MypageDTO searchMemberName(String id) {
		MypageDTO mDTO = new MypageDTO();
		MypageDAO mDAO = MypageDAO.getInstance();
		try {
			mDTO = mDAO.selectMember(id);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return mDTO;
	}//searchMemberName
	
	
	public List<MyTicketDTO> searchMyticket(int num) {
		List<MyTicketDTO> myticketList = new ArrayList<MyTicketDTO>();
		MypageDAO mDAO = MypageDAO.getInstance();
		try {
			myticketList = mDAO.selectMyTicket(num);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return myticketList;
	}//searchMyticket
	
	public List<PersonalDTO> searchPersonal(int resNum) {
		List<PersonalDTO> personList = new ArrayList<PersonalDTO>();
		MypageDAO mDAO = MypageDAO.getInstance();
		try {
			personList = mDAO.selectPersonal(resNum);
		} catch (SQLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		return personList;
	}//searchPersonal
	
}//NoticeService
