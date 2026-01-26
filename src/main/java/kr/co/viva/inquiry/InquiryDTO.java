package kr.co.viva.inquiry;

import java.util.Date;

public class InquiryDTO {
	private String title,msg,InquiryReturn;
	private int memberNum;
	private int inquiryNum, adminNum;
	private Date inputDate;
	public InquiryDTO() {
		super();
	}
	public InquiryDTO(String title, String msg, String inquiryReturn, int memberNum, int inquiryNum, int adminNum,
			Date inputDate) {
		super();
		this.title = title;
		this.msg = msg;
		InquiryReturn = inquiryReturn;
		this.memberNum = memberNum;
		this.inquiryNum = inquiryNum;
		this.adminNum = adminNum;
		this.inputDate = inputDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public String getInquiryReturn() {
		return InquiryReturn;
	}
	public void setInquiryReturn(String inquiryReturn) {
		InquiryReturn = inquiryReturn;
	}
	public int getMemberNum() {
		return memberNum;
	}
	public void setMemberNum(int memberNum) {
		this.memberNum = memberNum;
	}
	public int getInquiryNum() {
		return inquiryNum;
	}
	public void setInquiryNum(int inquiryNum) {
		this.inquiryNum = inquiryNum;
	}
	public int getAdminNum() {
		return adminNum;
	}
	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}
	public Date getInputDate() {
		return inputDate;
	}
	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}
	@Override
	public String toString() {
		return "InquiryDTO [title=" + title + ", msg=" + msg + ", InquiryReturn=" + InquiryReturn + ", memberNum="
				+ memberNum + ", inquiryNum=" + inquiryNum + ", adminNum=" + adminNum + ", inputDate=" + inputDate
				+ "]";
	}
	
	

	
}
