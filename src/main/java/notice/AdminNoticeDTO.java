package notice;

import java.sql.Date;

public class AdminNoticeDTO {
	private int noticeNum, noticeViews;
	private String noticeType, noticMsg, noticeTitle, noticeDelFlag, adminName;
	private Date noticeDate;

	public String getAdminName() {
		return adminName;
	}
	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}
	public AdminNoticeDTO(int noticeNum, int noticeViews, String noticeType, String noticMsg, String noticeTitle,
			String noticeDelFlag, String adminName, Date noticeDate) {
		super();
		this.noticeNum = noticeNum;
		this.noticeViews = noticeViews;
		this.noticeType = noticeType;
		this.noticMsg = noticMsg;
		this.noticeTitle = noticeTitle;
		this.noticeDelFlag = noticeDelFlag;
		this.adminName = adminName;
		this.noticeDate = noticeDate;
	}
	@Override
	public String toString() {
		return "NoticeDTO [noticeNum=" + noticeNum + ", noticeViews=" + noticeViews + ", noticeType=" + noticeType
				+ ", noticMsg=" + noticMsg + ", noticeTitle=" + noticeTitle + ", noticeDelFlag=" + noticeDelFlag
				+ ", adminName=" + adminName + ", noticeDate=" + noticeDate + "]";
	}
	public AdminNoticeDTO() {
		super();
	}
	public int getNoticeNum() {
		return noticeNum;
	}
	public void setNoticeNum(int noticeNum) {
		this.noticeNum = noticeNum;
	}
	public int getNoticeViews() {
		return noticeViews;
	}
	public void setNoticeViews(int noticeViews) {
		this.noticeViews = noticeViews;
	}
	public String getNoticeType() {
		return noticeType;
	}
	public void setNoticeType(String noticeType) {
		this.noticeType = noticeType;
	}
	public String getNoticMsg() {
		return noticMsg;
	}
	public void setNoticMsg(String noticMsg) {
		this.noticMsg = noticMsg;
	}
	public String getNoticeTitle() {
		return noticeTitle;
	}
	public void setNoticeTitle(String noticeTitle) {
		this.noticeTitle = noticeTitle;
	}
	public String getNoticeDelFlag() {
		return noticeDelFlag;
	}
	public void setNoticeDelFlag(String noticeDelFlag) {
		this.noticeDelFlag = noticeDelFlag;
	}
	public Date getNoticeDate() {
		return noticeDate;
	}
	public void setNoticeDate(Date noticeDate) {
		this.noticeDate = noticeDate;
	}
	
	

}
