package dashboard;


public class DashBoardTicketRevenueDTO {
	
	String date;
	int ticketRev;
	@Override
	public String toString() {
		return "DashBoardTicketRevenueDTO [date=" + date + ", ticketRev=" + ticketRev + "]";
	}
	public DashBoardTicketRevenueDTO(String date, int ticketRev) {
		super();
		this.date = date;
		this.ticketRev = ticketRev;
	}
	public DashBoardTicketRevenueDTO() {
		super();
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getTicketRev() {
		return ticketRev;
	}
	public void setTicketRev(int ticketRev) {
		this.ticketRev = ticketRev;
	}
	
	
	
	
}
