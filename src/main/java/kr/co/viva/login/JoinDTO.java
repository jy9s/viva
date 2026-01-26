package kr.co.viva.login;

import java.util.Date;

public class JoinDTO {
	private String id ,pass, name, tel , email, addr , addrDetail ; 
	private int zipCode;
	private String birth;
	public JoinDTO() {
		super();
	}
	public JoinDTO(String id, String pass, String name, String tel, String email, String addr, String addrDetail,
			int zipCode, String birth) {
		super();
		this.id = id;
		this.pass = pass;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.zipCode = zipCode;
		this.birth = birth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
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
	public int getZipCode() {
		return zipCode;
	}
	public void setZipCode(int zipCode) {
		this.zipCode = zipCode;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	@Override
	public String toString() {
		return "JoinDTO [id=" + id + ", pass=" + pass + ", name=" + name + ", tel=" + tel + ", email=" + email
				+ ", addr=" + addr + ", addrDetail=" + addrDetail + ", zipCode=" + zipCode + ", birth=" + birth + "]";
	}
	
	
}
