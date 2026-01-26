package kr.co.viva.perform;

import java.sql.Date;

public class PerformReserveDTO {

	String pResState, pResName, payAgency, payMethod,expiration,cardNum1,cardNum2,cardNum3,cardNum4,cvc;	
	int perfScheduleNum, pResNum,perfNum, pResPerson, 
	cardPass,installment,payPrice, payType, member_num;
	Date perfDate,pResDate,payDate;
	
	
	public PerformReserveDTO() {
		
	}


	public PerformReserveDTO(String pResState, String pResName, String payAgency, String payMethod, String expiration,
			String cardNum1, String cardNum2, String cardNum3, String cardNum4, String cvc, int perfScheduleNum,
			int pResNum, int perfNum, int pResPerson, int cardPass, int installment, int payPrice, int payType,
			int member_num, Date perfDate, Date pResDate, Date payDate) {
		super();
		this.pResState = pResState;
		this.pResName = pResName;
		this.payAgency = payAgency;
		this.payMethod = payMethod;
		this.expiration = expiration;
		this.cardNum1 = cardNum1;
		this.cardNum2 = cardNum2;
		this.cardNum3 = cardNum3;
		this.cardNum4 = cardNum4;
		this.cvc = cvc;
		this.perfScheduleNum = perfScheduleNum;
		this.pResNum = pResNum;
		this.perfNum = perfNum;
		this.pResPerson = pResPerson;
		this.cardPass = cardPass;
		this.installment = installment;
		this.payPrice = payPrice;
		this.payType = payType;
		this.member_num = member_num;
		this.perfDate = perfDate;
		this.pResDate = pResDate;
		this.payDate = payDate;
	}


	public String getpResState() {
		return pResState;
	}


	public void setpResState(String pResState) {
		this.pResState = pResState;
	}


	public String getpResName() {
		return pResName;
	}


	public void setpResName(String pResName) {
		this.pResName = pResName;
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


	public String getCardNum1() {
		return cardNum1;
	}


	public void setCardNum1(String cardNum1) {
		this.cardNum1 = cardNum1;
	}


	public String getCardNum2() {
		return cardNum2;
	}


	public void setCardNum2(String cardNum2) {
		this.cardNum2 = cardNum2;
	}


	public String getCardNum3() {
		return cardNum3;
	}


	public void setCardNum3(String cardNum3) {
		this.cardNum3 = cardNum3;
	}


	public String getCardNum4() {
		return cardNum4;
	}


	public void setCardNum4(String cardNum4) {
		this.cardNum4 = cardNum4;
	}


	public String getCvc() {
		return cvc;
	}


	public void setCvc(String cvc) {
		this.cvc = cvc;
	}


	public int getPerfScheduleNum() {
		return perfScheduleNum;
	}


	public void setPerfScheduleNum(int perfScheduleNum) {
		this.perfScheduleNum = perfScheduleNum;
	}


	public int getpResNum() {
		return pResNum;
	}


	public void setpResNum(int pResNum) {
		this.pResNum = pResNum;
	}


	public int getPerfNum() {
		return perfNum;
	}


	public void setPerfNum(int perfNum) {
		this.perfNum = perfNum;
	}


	public int getpResPerson() {
		return pResPerson;
	}


	public void setpResPerson(int pResPerson) {
		this.pResPerson = pResPerson;
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


	public int getPayPrice() {
		return payPrice;
	}


	public void setPayPrice(int payPrice) {
		this.payPrice = payPrice;
	}


	public int getPayType() {
		return payType;
	}


	public void setPayType(int payType) {
		this.payType = payType;
	}


	public int getMember_num() {
		return member_num;
	}


	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}


	public Date getPerfDate() {
		return perfDate;
	}


	public void setPerfDate(Date perfDate) {
		this.perfDate = perfDate;
	}


	public Date getpResDate() {
		return pResDate;
	}


	public void setpResDate(Date pResDate) {
		this.pResDate = pResDate;
	}


	public Date getPayDate() {
		return payDate;
	}


	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}


	@Override
	public String toString() {
		return "PerformReserveDTO [pResState=" + pResState + ", pResName=" + pResName + ", payAgency=" + payAgency
				+ ", payMethod=" + payMethod + ", expiration=" + expiration + ", cardNum1=" + cardNum1 + ", cardNum2="
				+ cardNum2 + ", cardNum3=" + cardNum3 + ", cardNum4=" + cardNum4 + ", cvc=" + cvc + ", perfScheduleNum="
				+ perfScheduleNum + ", pResNum=" + pResNum + ", perfNum=" + perfNum + ", pResPerson=" + pResPerson
				+ ", cardPass=" + cardPass + ", installment=" + installment + ", payPrice=" + payPrice + ", payType="
				+ payType + ", member_num=" + member_num + ", perfDate=" + perfDate + ", pResDate=" + pResDate
				+ ", payDate=" + payDate + "]";
	}

	
	
}