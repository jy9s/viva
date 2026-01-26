package qna;

import java.sql.Date;

public class AdminQnaDTO {
	private int inquiryNum, memberNum, adminNum;
	private String inquiryTitle,inquiryMsg,inquiryReturn;
	private String memberName, memberEmail;
	private Date inquiryDate;
	@Override
	public String toString() {
		return "QnaDTO [inquiryNum=" + inquiryNum + ", memberNum=" + memberNum + ", adminNum=" + adminNum
				+ ", inquiryTitle=" + inquiryTitle + ", inquiryMsg=" + inquiryMsg + ", inquiryReturn=" + inquiryReturn
				+ ", memberName=" + memberName + ", memberEmail=" + memberEmail + ", inquriyDate=" + inquiryDate + "]";
	}
	public AdminQnaDTO(int inquiryNum, int memberNum, int adminNum, String inquiryTitle, String inquiryMsg,
			String inquiryReturn, String memberName, String memberEmail, Date inquiryDate) {
		super();
		this.inquiryNum = inquiryNum;
		this.memberNum = memberNum;
		this.adminNum = adminNum;
		this.inquiryTitle = inquiryTitle;
		this.inquiryMsg = inquiryMsg;
		this.inquiryReturn = inquiryReturn;
		this.memberName = memberName;
		this.memberEmail = memberEmail;
		this.inquiryDate = inquiryDate;
	}
	public AdminQnaDTO() {
		super();
	}
	public int getInquiryNum() {
		return inquiryNum;
	}
	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}
	public String getInquiryTitle() {
		return inquiryTitle;
	}
	public void setInquiryTitle(String inquiryTitle) {
		this.inquiryTitle = inquiryTitle;
	}
	public String getInquiryMsg() {
		return inquiryMsg;
	}
	public void setInquiryMsg(String inquiryMsg) {
		this.inquiryMsg = inquiryMsg;
	}
	public String getInquiryReturn() {
		return inquiryReturn;
	}
	public void setInquiryReturn(String inquiryReturn) {
		this.inquiryReturn = inquiryReturn;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public String getMemberEmail() {
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) {
		this.memberEmail = memberEmail;
	}
	public Date getInquiryDate() {
		return inquiryDate;
	}
	public void setInquiryDate(Date inquiryDate) {
		this.inquiryDate = inquiryDate;
	}
	
	
	
	
}
