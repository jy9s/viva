package kr.co.viva.payHistory;


public class payHistoryDTO {
	private int num,adultCnt,teenagerCnt,kidsCnt ,adultPrice, teenPrice,kidsprice ,discount, price, installment;
	private String  payDate;
	private String tName,  state;
	public payHistoryDTO() {
		super();
			adultCnt=0;
			teenagerCnt=0;
			kidsCnt=0;
			adultPrice=0;
			teenPrice=0;
			kidsprice=0;
			discount=1;
		
		
	}
	public payHistoryDTO(int num, int adultCnt, int teenagerCnt, int kidsCnt, int adultPrice, int teenPrice,
			int kidsprice, int discount, int price, int installment, String payDate, String tName, String state) {
		super();
		this.num = num;
		this.adultCnt = adultCnt;
		this.teenagerCnt = teenagerCnt;
		this.kidsCnt = kidsCnt;
		this.adultPrice = adultPrice;
		this.teenPrice = teenPrice;
		this.kidsprice = kidsprice;
		this.discount = discount;
		this.price = price;
		this.installment = installment;
		this.payDate = payDate;
		this.tName = tName;
		this.state = state;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public int getAdultCnt() {
		return adultCnt;
	}
	public void setAdultCnt(int adultCnt) {
		this.adultCnt = adultCnt;
	}
	public int getTeenagerCnt() {
		return teenagerCnt;
	}
	public void setTeenagerCnt(int teenagerCnt) {
		this.teenagerCnt = teenagerCnt;
	}
	public int getKidsCnt() {
		return kidsCnt;
	}
	public void setKidsCnt(int kidsCnt) {
		this.kidsCnt = kidsCnt;
	}
	public int getAdultPrice() {
		return adultPrice;
	}
	public void setAdultPrice(int adultPrice) {
		this.adultPrice = adultPrice;
	}
	public int getTeenPrice() {
		return teenPrice;
	}
	public void setTeenPrice(int teenPrice) {
		this.teenPrice = teenPrice;
	}
	public int getKidsprice() {
		return kidsprice;
	}
	public void setKidsprice(int kidsprice) {
		this.kidsprice = kidsprice;
	}
	public int getDiscount() {
		return discount;
	}
	public void setDiscount(int discount) {
		this.discount = discount;
	}
	public int getPrice() {
		price =(int)((adultCnt*adultPrice+teenagerCnt*teenPrice+kidsCnt*kidsprice)*((100-discount)/100.0));
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getInstallment() {
		return installment;
	}
	public void setInstallment(int installment) {
		this.installment = installment;
	}
	public String getPayDate() {
		return payDate;
	}
	public void setPayDate(String payDate) {
		this.payDate = payDate;
	}
	public String gettName() {
		return tName;
	}
	public void settName(String tName) {
		this.tName = tName;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "payHistoryDTO [num=" + num + ", adultCnt=" + adultCnt + ", teenagerCnt=" + teenagerCnt + ", kidsCnt="
				+ kidsCnt + ", adultPrice=" + adultPrice + ", teenPrice=" + teenPrice + ", kidsprice=" + kidsprice
				+ ", discount=" + discount + ", price=" + price + ", installment=" + installment + ", payDate="
				+ payDate + ", tName=" + tName + ", state=" + state + "]";
	}
	
}