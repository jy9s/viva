package faq;

import java.sql.Date;

public class AdminFaqDTO {
	private int faqNum;
	private String faqType, faqMsg, faqTitle, faqDelFlag, adminName;
	private Date faqDate;
	@Override
	public String toString() {
		return "FaqDTO [faqNum=" + faqNum + ", faqType=" + faqType + ", faqMsg=" + faqMsg + ", faqTitle=" + faqTitle
				+ ", faqDelFlag=" + faqDelFlag + ", adminName=" + adminName + ", faqDate=" + faqDate + "]";
	}
	public AdminFaqDTO(int faqNum, String faqType, String faqMsg, String faqTitle, String faqDelFlag, String adminName,
			Date faqDate) {
		super();
		this.faqNum = faqNum;
		this.faqType = faqType;
		this.faqMsg = faqMsg;
		this.faqTitle = faqTitle;
		this.faqDelFlag = faqDelFlag;
		this.adminName = adminName;
		this.faqDate = faqDate;
	}
	public AdminFaqDTO() {
		super();
	}
	public int getFaqNum() {
		return faqNum;
	}
	public void setFaqNum(int faqNum) {
		this.faqNum = faqNum;
	}
	public String getFaqType() {
		return faqType;
	}
	public void setFaqType(String faqType) {
		this.faqType = faqType;
	}
	public String getFaqMsg() {
		return faqMsg;
	}
	public void setFaqMsg(String faqMsg) {
		this.faqMsg = faqMsg;
	}
	public String getFaqTitle() {
		return faqTitle;
	}
	public void setFaqTitle(String faqTitle) {
		this.faqTitle = faqTitle;
	}
	public String getFaqDelFlag() {
		return faqDelFlag;
	}
	public void setFaqDelFlag(String faqDelFlag) {
		this.faqDelFlag = faqDelFlag;
	}
	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public Date getFaqDate() {
		return faqDate;
	}
	public void setFaqDate(Date faqDate) {
		this.faqDate = faqDate;
	}


}
