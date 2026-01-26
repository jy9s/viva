package dashboard;


public class DashBoardPerfRevenueDTO {
	
	String date;
	int perfRev;
	@Override
	public String toString() {
		return "DashBoardPerfRevenueDTO [date=" + date + ", perfRev=" + perfRev + "]";
	}
	public DashBoardPerfRevenueDTO(String date, int perfRev) {
		super();
		this.date = date;
		this.perfRev = perfRev;
	}
	public DashBoardPerfRevenueDTO() {
		super();
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getPerfRev() {
		return perfRev;
	}
	public void setPerfRev(int perfRev) {
		this.perfRev = perfRev;
	}

	
	
	
}
