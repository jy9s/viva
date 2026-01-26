package dashboard;


public class DashBoardDailyUserDTO {
	
	String date;
	int annUser, normalUser;
	public DashBoardDailyUserDTO(String date, int annUser, int normalUser) {
		super();
		this.date = date;
		this.annUser = annUser;
		this.normalUser = normalUser;
	}
	public DashBoardDailyUserDTO() {
		super();
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getAnnUser() {
		return annUser;
	}
	public void setAnnUser(int annUser) {
		this.annUser = annUser;
	}
	public int getNormalUser() {
		return normalUser;
	}
	public void setNormalUser(int normalUser) {
		this.normalUser = normalUser;
	}
	@Override
	public String toString() {
		return "DashBoardDailyUserDTO [date=" + date + ", annUser=" + annUser + ", normalUser=" + normalUser + "]";
	}
	
	
	
}
