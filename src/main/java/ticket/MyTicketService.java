package ticket;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MyTicketService {
	private static MyTicketService mts;
	
	private MyTicketService() {
		
	}//MyTicketService
	

	public static MyTicketService getInstance() {
		if( mts == null ) {
			mts=new MyTicketService();
		}//end if
		
		return mts;
	}//getInstance
	
	
	public List<MyTicketDTO> searchTicket(int memberNum) {
	    List<MyTicketDTO> list = new ArrayList<>();

	    MyTicketDAO mtDAO = MyTicketDAO.getInstance();

	    try {
	        list = mtDAO.selectTicket(memberNum);
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return list;
	}//searchTicket
	
	
	public boolean refundTicket(int tResNum) {
	    boolean flag = false;
	    MyTicketDAO mtDAO = MyTicketDAO.getInstance();

	    try {
	        flag = mtDAO.updateTicket(tResNum)==1;
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }

	    return flag;
	}

	
	public MyTicketDTO searchTicketDetail(int memberNum, int ticketNum) {
	    
		MyTicketDTO mtDTO=null;
		MyTicketDAO mtDAO=MyTicketDAO.getInstance();
		
		
		try {
			mtDTO = mtDAO.selectTicketDetail(memberNum, ticketNum);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return mtDTO;
	}

	
}//class
