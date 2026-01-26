package kr.co.viva.pay;

public class PayInfoDTO {
	private int payinfoNum, payNum, cardNum1, cardNum2, cardNum3, cardNum4, cvc, cardPass, installment;
	private String cardCode, payAgency, payMethod, expiration;
	
	
	public PayInfoDTO() {
		super();
	}


	public PayInfoDTO(int payinfoNum, int payNum, int cardNum1, int cardNum2, int cardNum3, int cardNum4, int cvc,
			int cardPass, int installment, String cardCode, String payAgency, String payMethod, String expiration) {
		super();
		this.payinfoNum = payinfoNum;
		this.payNum = payNum;
		this.cardNum1 = cardNum1;
		this.cardNum2 = cardNum2;
		this.cardNum3 = cardNum3;
		this.cardNum4 = cardNum4;
		this.cvc = cvc;
		this.cardPass = cardPass;
		this.installment = installment;
		this.cardCode = cardCode;
		this.payAgency = payAgency;
		this.payMethod = payMethod;
		this.expiration = expiration;
	}


	public int getPayinfoNum() {
		return payinfoNum;
	}


	public void setPayinfoNum(int payinfoNum) {
		this.payinfoNum = payinfoNum;
	}


	public int getPayNum() {
		return payNum;
	}


	public void setPayNum(int payNum) {
		this.payNum = payNum;
	}


	public int getCardNum1() {
		return cardNum1;
	}


	public void setCardNum1(int cardNum1) {
		this.cardNum1 = cardNum1;
	}


	public int getCardNum2() {
		return cardNum2;
	}


	public void setCardNum2(int cardNum2) {
		this.cardNum2 = cardNum2;
	}


	public int getCardNum3() {
		return cardNum3;
	}


	public void setCardNum3(int cardNum3) {
		this.cardNum3 = cardNum3;
	}


	public int getCardNum4() {
		return cardNum4;
	}


	public void setCardNum4(int cardNum4) {
		this.cardNum4 = cardNum4;
	}


	public int getCvc() {
		return cvc;
	}


	public void setCvc(int cvc) {
		this.cvc = cvc;
	}


	public int getCardPass() {
		return cardPass;
	}


	public void setCardPass(int cardPass) {
		this.cardPass = cardPass;
	}


	public int getInstallment() {
		return installment;
	}


	public void setInstallment(int installment) {
		this.installment = installment;
	}


	public String getCardCode() {
		return cardCode;
	}


	public void setCardCode(String cardCode) {
		this.cardCode = cardCode;
	}


	public String getPayAgency() {
		return payAgency;
	}


	public void setPayAgency(String payAgency) {
		this.payAgency = payAgency;
	}


	public String getPayMethod() {
		return payMethod;
	}


	public void setPayMethod(String payMethod) {
		this.payMethod = payMethod;
	}


	public String getExpiration() {
		return expiration;
	}


	public void setExpiration(String expiration) {
		this.expiration = expiration;
	}


	@Override
	public String toString() {
		return "PayInfoDTO [payinfoNum=" + payinfoNum + ", payNum=" + payNum + ", cardNum1=" + cardNum1 + ", cardNum2="
				+ cardNum2 + ", cardNum3=" + cardNum3 + ", cardNum4=" + cardNum4 + ", cvc=" + cvc + ", cardPass="
				+ cardPass + ", installment=" + installment + ", cardCode=" + cardCode + ", payAgency=" + payAgency
				+ ", payMethod=" + payMethod + ", expiration=" + expiration + "]";
	}


	
}
