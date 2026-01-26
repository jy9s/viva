package kr.co.viva.login;

import java.sql.Date;

public class SearchDTO {
	
	String id,pass,tel,name;
	int member_num;
	Date birth;
	
	public SearchDTO() {
	}

	public SearchDTO(String id, String pass, String tel, String name, int member_num, Date birth) {
		super();
		this.id = id;
		this.pass = pass;
		this.tel = tel;
		this.name = name;
		this.member_num = member_num;
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

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public Date getBirth() {
		return birth;
	}

	public void setBirth(Date birth) {
		this.birth = birth;
	}

	@Override
	public String toString() {
		return "SearchDTO [id=" + id + ", pass=" + pass + ", tel=" + tel + ", name=" + name + ", member_num="
				+ member_num + ", birth=" + birth + "]";
	}

	
	
	
}
