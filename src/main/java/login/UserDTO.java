package login;

import java.util.Date;

public class UserDTO {
	private int userNum, zipCode;
	private String id, pw, name, email, addr, addrDetail, tel, birth, delFlag;
	private Date inputDate;
	
	
	
	
	
	public UserDTO() {
		super();
	}





	public UserDTO(int userNum, int zipCode, String id, String pw, String name, String email, String addr,
			String addrDetail, String tel, String birth, String delFlag, Date inputDate) {
		super();
		this.userNum = userNum;
		this.zipCode = zipCode;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.email = email;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.tel = tel;
		this.birth = birth;
		this.delFlag = delFlag;
		this.inputDate = inputDate;
	}





	public int getUserNum() {
		return userNum;
	}





	public void setUserNum(int userNum) {
		this.userNum = userNum;
	}





	public int getZipCode() {
		return zipCode;
	}





	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
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





	public String getEmail() {
		return email;
	}





	public void setEmail(String email) {
		this.email = email;
	}





	public String getAddr() {
		return addr;
	}





	public void setAddr(String addr) {
		this.addr = addr;
	}





	public String getAddrDetail() {
		return addrDetail;
	}





	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}





	public String getTel() {
		return tel;
	}





	public void setTel(String tel) {
		this.tel = tel;
	}





	public String getBirth() {
		return birth;
	}





	public void setBirth(String birth) {
		this.birth = birth;
	}





	public String getDelFlag() {
		return delFlag;
	}





	public void setDelFlag(String delFlag) {
		this.delFlag = delFlag;
	}





	public Date getInputDate() {
		return inputDate;
	}





	public void setInputDate(Date inputDate) {
		this.inputDate = inputDate;
	}





	@Override
	public String toString() {
		return "UserDTO [userNum=" + userNum + ", zipCode=" + zipCode + ", id=" + id + ", pw=" + pw + ", name=" + name
				+ ", email=" + email + ", addr=" + addr + ", addrDetail=" + addrDetail + ", tel=" + tel + ", birth="
				+ birth + ", delFlag=" + delFlag + ", inputDate=" + inputDate + "]";
	}
	
	
	
}
