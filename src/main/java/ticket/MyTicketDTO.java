package ticket;

import java.sql.Date;

public class MyTicketDTO {
	
	private int ticketNum;
	private String ticketName, personCnt, payMethod, qrCode;
	private Date useDate, tResDate;
	private String adultTicket, teenTicket, childTicket;
    private int adultCount, teenCount, childCount;
	
    public MyTicketDTO() {
	}
	
	public MyTicketDTO(int ticketNum, String ticketName, String personCnt, String payMethod, String qrCode,
			Date useDate, Date tResDate, String adultTicket, String teenTicket, String childTicket, int adultCount,
			int teenCount, int childCount) {
		super();
		this.ticketNum = ticketNum;
		this.ticketName = ticketName;
		this.personCnt = personCnt;
		this.payMethod = payMethod;
		this.qrCode = qrCode;
		this.useDate = useDate;
		this.tResDate = tResDate;
		this.adultTicket = adultTicket;
		this.teenTicket = teenTicket;
		this.childTicket = childTicket;
		this.adultCount = adultCount;
		this.teenCount = teenCount;
		this.childCount = childCount;
	}

	public int getTicketNum() {
		return ticketNum;
	}

	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}

	public String getTicketName() {
		return ticketName;
	}

	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}

	public String getPersonCnt() {
		return personCnt;
	}

	public void setPersonCnt(String personCnt) {
		this.personCnt = personCnt;
	}

	public String getPayMethod() {
		return payMethod;
	}

	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}

	public String getQrCode() {
		return qrCode;
	}

	public void setQrCode(String qrCode) {
		this.qrCode = qrCode;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public Date gettResDate() {
		return tResDate;
	}

	public void settResDate(Date tResDate) {
		this.tResDate = tResDate;
	}

	public String getAdultTicket() {
		return adultTicket;
	}

	public void setAdultTicket(String adultTicket) {
		this.adultTicket = adultTicket;
	}

	public String getTeenTicket() {
		return teenTicket;
	}

	public void setTeenTicket(String teenTicket) {
		this.teenTicket = teenTicket;
	}

	public String getChildTicket() {
		return childTicket;
	}

	public void setChildTicket(String childTicket) {
		this.childTicket = childTicket;
	}

	public int getAdultCount() {
		return adultCount;
	}

	public void setAdultCount(int adultCount) {
		this.adultCount = adultCount;
	}

	public int getTeenCount() {
		return teenCount;
	}

	public void setTeenCount(int teenCount) {
		this.teenCount = teenCount;
	}

	public int getChildCount() {
		return childCount;
	}

	public void setChildCount(int childCount) {
		this.childCount = childCount;
	}

	@Override
	public String toString() {
		return "MyTicketDTO [ticketNum=" + ticketNum + ", ticketName=" + ticketName + ", personCnt=" + personCnt
				+ ", payMethod=" + payMethod + ", qrCode=" + qrCode + ", useDate=" + useDate + ", tResDate=" + tResDate
				+ ", adultTicket=" + adultTicket + ", teenTicket=" + teenTicket + ", childTicket=" + childTicket
				+ ", adultCount=" + adultCount + ", teenCount=" + teenCount + ", childCount=" + childCount + "]";
	}
	
    
    
    
    
}//class
