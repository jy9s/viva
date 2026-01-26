package kr.co.viva.pay;

import java.util.Date;

public class ResInfoDTO {
	private int memberNum, ticketNum, adultCnt, teenAgerCnt, kidsCnt, totalPrice, prom_num, discount;
	private Date resDate, useDate;
	private String prom_pay_agency;
	private String ticketType; // "daily" or "annual"

	public ResInfoDTO() {
		super();
	}

	//별도 추가한 메소드
    public boolean isAnnual() {
        return "annual".equals(ticketType);
    }

    // getter / setter
    public String getTicketType() {
        return ticketType;
    }

    public void setTicketType(String ticketType) {
        this.ticketType = ticketType;
    }
	
	
    
	
	public ResInfoDTO(int memberNum, int ticketNum, int adultCnt, int teenAgerCnt, int kidsCnt, int totalPrice,
			int prom_num, int discount, Date resDate, Date useDate, String prom_pay_agency, String ticketType) {
		super();
		this.memberNum = memberNum;
		this.ticketNum = ticketNum;
		this.adultCnt = adultCnt;
		this.teenAgerCnt = teenAgerCnt;
		this.kidsCnt = kidsCnt;
		this.totalPrice = totalPrice;
		this.prom_num = prom_num;
		this.discount = discount;
		this.resDate = resDate;
		this.useDate = useDate;
		this.prom_pay_agency = prom_pay_agency;
		this.ticketType = ticketType;
	}

	public int getMemberNum() {
		return memberNum;
	}

	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}

	public int getTicketNum() {
		return ticketNum;
	}

	public void setTicketNum(int ticketNum) {
		this.ticketNum = ticketNum;
	}

	public int getAdultCnt() {
		return adultCnt;
	}

	public void setAdultCnt(int adultCnt) {
		this.adultCnt = adultCnt;
	}

	public int getTeenAgerCnt() {
		return teenAgerCnt;
	}

	public void setTeenAgerCnt(int teenAgerCnt) {
		this.teenAgerCnt = teenAgerCnt;
	}

	public int getKidsCnt() {
		return kidsCnt;
	}

	public void setKidsCnt(int kidsCnt) {
		this.kidsCnt = kidsCnt;
	}

	public int getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}

	public int getProm_num() {
		return prom_num;
	}

	public void setProm_num(int prom_num) {
		this.prom_num = prom_num;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public Date getResDate() {
		return resDate;
	}

	public void setResDate(Date resDate) {
		this.resDate = resDate;
	}

	public Date getUseDate() {
		return useDate;
	}

	public void setUseDate(Date useDate) {
		this.useDate = useDate;
	}

	public String getProm_pay_agency() {
		return prom_pay_agency;
	}

	public void setProm_pay_agency(String prom_pay_agency) {
		this.prom_pay_agency = prom_pay_agency;
	}

	@Override
	public String toString() {
		return "ResInfoDTO [memberNum=" + memberNum + ", ticketNum=" + ticketNum + ", adultCnt=" + adultCnt
				+ ", teenAgerCnt=" + teenAgerCnt + ", kidsCnt=" + kidsCnt + ", totalPrice=" + totalPrice + ", prom_num="
				+ prom_num + ", discount=" + discount + ", resDate=" + resDate + ", useDate=" + useDate
				+ ", prom_pay_agency=" + prom_pay_agency + ", ticketType=" + ticketType + "]";
	}


	
	
}
