package kr.co.viva.pay;

public class PromotionDTO {
	private int promNum, discount;
	private String promPayAgency;
	
	public PromotionDTO() {
		super();
	}

	public PromotionDTO(int promNum, int discount, String promPayAgency) {
		super();
		this.promNum = promNum;
		this.discount = discount;
		this.promPayAgency = promPayAgency;
	}

	public int getPromNum() {
		return promNum;
	}

	public void setPromNum(int promNum) {
		this.promNum = promNum;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	public String getPromPayAgency() {
		return promPayAgency;
	}

	public void setPromPayAgency(String promPayAgency) {
		this.promPayAgency = promPayAgency;
	}

	@Override
	public String toString() {
		return "PromotionDTO [promNum=" + promNum + ", discount=" + discount + ", promPayAgency=" + promPayAgency + "]";
	}

	
	
}
