package dashboard;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DashBoardService {
	
	public List<DashBoardDailyUserDTO> searchTotalDailyUser() throws SQLException{
		List<DashBoardDailyUserDTO> list = new ArrayList<DashBoardDailyUserDTO>();
		
		DashBoardDailyUserDAO dbduDAO = DashBoardDailyUserDAO.getInstance();
		list = dbduDAO.searchTotalUser();
		
		return list;
				
	}
	
	public int searchTotalTodayUser() throws SQLException{
		int totalDailyUser = 0;		
		DashBoardDailyUserDAO dbduDAO = DashBoardDailyUserDAO.getInstance();
		
		totalDailyUser = dbduDAO.searchTodayUser();
		
		return totalDailyUser;
		
	}
	
	public List<DashBoardPerfRevenueDTO> searchTotalPerf() throws SQLException{
		List<DashBoardPerfRevenueDTO> list = new ArrayList<DashBoardPerfRevenueDTO>();
		
		DashBoardPerfRevenueDAO dbprDAO = DashBoardPerfRevenueDAO.getInstance();
		list = dbprDAO.selectTotalPerf();
		
		return list;
				
	}
	
	public List<DashBoardTicketRevenueDTO> searchTotalTicket() throws SQLException{
		List<DashBoardTicketRevenueDTO> list = new ArrayList<DashBoardTicketRevenueDTO>();
		
		DashBoardTicketRevenueDAO dbtrDAO = DashBoardTicketRevenueDAO.getInstance();
		list = dbtrDAO.selectTotalTicket();
		
		return list;
		
	}
	
	public int searchTodayInquiry() {
		int cnt = 0;
		DashBoardDailyInquiryDAO dbdiDAO = DashBoardDailyInquiryDAO.getInstance();
		
		try {
			cnt = dbdiDAO.selectTodayInquiry();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int searchTodayReply() {
		int cnt = 0;
		DashBoardDailyInquiryDAO dbdiDAO = DashBoardDailyInquiryDAO.getInstance();
		
		try {
			cnt = dbdiDAO.selectTodayReply();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
	public int searchTodayOffOperate() {
		int cnt = 0;
		DashBoardDailyOperateDAO dbdiDAO = DashBoardDailyOperateDAO.getInstance();
		
		try {
			cnt = dbdiDAO.selectTodayOffOperate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int searchTodayOnOperate() {
		int cnt = 0;
		DashBoardDailyOperateDAO dbdiDAO = DashBoardDailyOperateDAO.getInstance();
		
		try {
			cnt = dbdiDAO.selectTodayOnOperate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	public int searchTodayTicket() {
		int cnt = 0;
		DashBoardReserveDAO dbdiDAO = DashBoardReserveDAO.getInstance();
		
		try {
			cnt = dbdiDAO.selectTodayTicket();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	public int searchTodayRefundTicket() {
		int cnt = 0;
		DashBoardReserveDAO dbdiDAO = DashBoardReserveDAO.getInstance();
		
		try {
			cnt = dbdiDAO.selectTodayRefundTicket();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	public int searchTodayPerf() {
		int cnt = 0;
		DashBoardReserveDAO dbdiDAO = DashBoardReserveDAO.getInstance();
		
		try {
			cnt = dbdiDAO.selectTodayPerf();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	public int searchTodayRefundPerf() {
		int cnt = 0;
		DashBoardReserveDAO dbdiDAO = DashBoardReserveDAO.getInstance();
		
		try {
			cnt = dbdiDAO.selectTodayRefundPerf();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return cnt;
	}
	
	
	
	
	
	
}
