package kr.co.viva.pay;

public class ResDTO {
	private int ticketNum, adultPrice, teenAgerPrice, kidsPrice;
	private String ticketName;
	
	public ResDTO() {
		super();
	}

	public ResDTO(int ticketNum, int adultPrice, int teenAgerPrice, int kidsPrice, String ticketName) {
		super();
		this.ticketNum = ticketNum;
		this.adultPrice = adultPrice;
		this.teenAgerPrice = teenAgerPrice;
		this.kidsPrice = kidsPrice;
		this.ticketName = ticketName;
	}

	public int getTicketNum() {
		return ticketNum;
	}

	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}

	public int getAdultPrice() {
		return adultPrice;
	}

	public void setAdultPrice(int adultPrice) {
		this.adultPrice = adultPrice;
	}

	public int getTeenAgerPrice() {
		return teenAgerPrice;
	}

	public void setTeenAgerPrice(int teenAgerPrice) {
		this.teenAgerPrice = teenAgerPrice;
	}

	public int getKidsPrice() {
		return kidsPrice;
	}

	public void setKidsPrice(int kidsPrice) {
		this.kidsPrice = kidsPrice;
	}

	public String getTicketName() {
		return ticketName;
	}

	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}

	@Override
	public String toString() {
		return "ResDTO [ticketNum=" + ticketNum + ", adultPrice=" + adultPrice + ", teenAgerPrice=" + teenAgerPrice
				+ ", kidsPrice=" + kidsPrice + ", ticketName=" + ticketName + "]";
	}

	
	
}
