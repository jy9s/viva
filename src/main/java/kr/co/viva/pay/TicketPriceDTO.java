package kr.co.viva.pay;

public class TicketPriceDTO {
	private int ticketNum, adultPrice, teenAgerPrice, kidsPrice;
	private String ticketType, ticketName;
	
	public TicketPriceDTO() {
		super();
	}

	public TicketPriceDTO(int ticketNum, int adultPrice, int teenAgerPrice, int kidsPrice, String ticketType,
			String ticketName) {
		super();
		this.ticketNum = ticketNum;
		this.adultPrice = adultPrice;
		this.teenAgerPrice = teenAgerPrice;
		this.kidsPrice = kidsPrice;
		this.ticketType = ticketType;
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

	public String getTicketType() {
		return ticketType;
	}

	public void setTicketType(String ticketType) {
		this.ticketType = ticketType;
	}

	public String getTicketName() {
		return ticketName;
	}

	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}

	@Override
	public String toString() {
		return "TicketPriceDTO [ticketNum=" + ticketNum + ", adultPrice=" + adultPrice + ", teenAgerPrice="
				+ teenAgerPrice + ", kidsPrice=" + kidsPrice + ", ticketType=" + ticketType + ", ticketName="
				+ ticketName + "]";
	}

	
	
}
