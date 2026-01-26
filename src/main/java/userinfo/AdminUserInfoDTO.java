package userinfo;

import java.util.Date;

public class AdminUserInfoDTO {
	private int userNum;
	private String userName, userAddr, userId, userEmail, userTel, userFlag;
	private Date userInputDate;
	
	public AdminUserInfoDTO() {
		super();
	}
	
	public AdminUserInfoDTO(int userNum, String userName, String userAddr, String userId, String userEmail, String userTel,
			String userFlag, Date userInputDate) {
		super();
		this.userNum = userNum;
		this.userName = userName;
		this.userAddr = userAddr;
		this.userId = userId;
		this.userEmail = userEmail;
		this.userTel = userTel;
		this.userFlag = userFlag;
		this.userInputDate = userInputDate;
	}
	
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getUserAddr() {
		return userAddr;
	}
	public void setUserAddr(String userAddr) {
		this.userAddr = userAddr;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserEmail() {
		return userEmail;
	}
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	public String getUserTel() {
		return userTel;
	}
	public void setUserTel(String userTel) {
		this.userTel = userTel;
	}
	public String getUserFlag() {
		return userFlag;
	}
	public void setUserFlag(String userFlag) {
		this.userFlag = userFlag;
	}
	public Date getUserInputDate() {
		return userInputDate;
	}
	public void setUserInputDate(Date userInputDate) {
		this.userInputDate = userInputDate;
	}

	@Override
	public String toString() {
		return "UserInfoDTO [userNum=" + userNum + ", userName=" + userName + ", userAddr=" + userAddr + ", userId="
				+ userId + ", userEmail=" + userEmail + ", userTel=" + userTel + ", userFlag=" + userFlag
				+ ", userInputDate=" + userInputDate + "]";
	}
	
	
	
}
