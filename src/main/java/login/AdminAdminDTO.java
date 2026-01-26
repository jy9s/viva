package login;

public class AdminAdminDTO {
	private int adminNum;
	private String adminId, adminPass, adminName;
	
	
	
	
	
	
	public int getAdminNum() {
		return adminNum;
	}






	public void setAdminNum(int adminNum) {
		this.adminNum = adminNum;
	}






	public String getAdminId() {
		return adminId;
	}






	public void setAdminId(String adminId) {
		this.adminId = adminId;
	}






	public String getAdminPass() {
		return adminPass;
	}






	public void setAdminPass(String adminPass) {
		this.adminPass = adminPass;
	}






	public String getAdminName() {
		return adminName;
	}






	public void setAdminName(String adminName) {
		this.adminName = adminName;
	}






	public AdminAdminDTO() {
		super();
	}






	public AdminAdminDTO(int adminNum, String adminId, String adminPass, String adminName) {
		super();
		this.adminNum = adminNum;
		this.adminId = adminId;
		this.adminPass = adminPass;
		this.adminName = adminName;
	}






	@Override
	public String toString() {
		return "AdminDTO [adminNum=" + adminNum + ", adminId=" + adminId + ", adminPass=" + adminPass + ", adminName="
				+ adminName + "]";
	}
	
	
}
