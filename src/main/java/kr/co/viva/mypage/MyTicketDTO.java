package kr.co.viva.mypage;

import java.util.Date;

public class MyTicketDTO {
	private String ticketName, payMethod, ticket_Qr;
	private Date tResDate, useDate;
	private int ticketNum,adultPrice,teenagerPrice,kidPrice, discount;
	public MyTicketDTO() {
		super();
	}
	public MyTicketDTO(String ticketName, String payMethod, String ticket_Qr, Date tResDate, Date useDate,
			int ticketNum, int adultPrice, int teenagerPrice, int kidPrice, int discount) {
		super();
		this.ticketName = ticketName;
		this.payMethod = payMethod;
		this.ticket_Qr = ticket_Qr;
		this.tResDate = tResDate;
		this.useDate = useDate;
		this.ticketNum = ticketNum;
		this.adultPrice = adultPrice;
		this.teenagerPrice = teenagerPrice;
		this.kidPrice = kidPrice;
		this.discount = discount;
	}
	public String getTicketName() {
		return ticketName;
	}
	public void setTicketName(String ticketName) {
		this.ticketName = ticketName;
	}
	public String getPayMethod() {
		return payMethod;
	}
	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}
	public String getTicket_Qr() {
		return ticket_Qr;
	}
	public void setTicket_Qr(String ticket_Qr) {
		this.ticket_Qr = ticket_Qr;
	}
	public Date gettResDate() {
		return tResDate;
	}
	public void settResDate(Date tResDate) {
		this.tResDate = tResDate;
	}
	public Date getUseDate() {
		return useDate;
	}
	public void setUseDate(Date useDate) {
		this.useDate = useDate;
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
	public int getTeenagerPrice() {
		return teenagerPrice;
	}
	public void setTeenagerPrice(int teenagerPrice) {
		this.teenagerPrice = teenagerPrice;
	}
	public int getKidPrice() {
		return kidPrice;
	}
	public void setKidPrice(int kidPrice) {
		this.kidPrice = kidPrice;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	@Override
	public String toString() {
		return "MyTicketDTO [ticketName=" + ticketName + ", payMethod=" + payMethod + ", ticket_Qr=" + ticket_Qr
				+ ", tResDate=" + tResDate + ", useDate=" + useDate + ", ticketNum=" + ticketNum + ", adultPrice="
				+ adultPrice + ", teenagerPrice=" + teenagerPrice + ", kidPrice=" + kidPrice + ", discount=" + discount
				+ "]";
	}
	
}

