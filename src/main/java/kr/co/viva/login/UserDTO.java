package kr.co.viva.login;
public class UserDTO {
	private int userNum;
	private String id, pw, name, delFlage;
	public int getUserNum() {
		return userNum;
	}
	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getDelFlage() {
		return delFlage;
	}
	public void setDelFlage(String delFlage) {
		this.delFlage = delFlage;
	}
	@Override
	public String toString() {
		return "UserDTO [userNum=" + userNum + ", id=" + id + ", pw=" + pw + ", name=" + name + ", delFlage=" + delFlage
				+ ", getUserNum()=" + getUserNum() + ", getId()=" + getId() + ", getPw()=" + getPw() + ", getName()="
				+ getName() + ", getDelFlage()=" + getDelFlage() + ", getClass()=" + getClass() + ", hashCode()="
				+ hashCode() + ", toString()=" + super.toString() + "]";
	}
	public UserDTO(int userNum, String id, String pw, String name, String delFlage) {
		super();
		this.userNum = userNum;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.delFlage = delFlage;
	}
	public UserDTO() {
		super();
	}
	
	
	
}
