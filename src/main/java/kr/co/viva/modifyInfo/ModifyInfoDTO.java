package kr.co.viva.modifyInfo;


public class ModifyInfoDTO {
	private String id , name, tel , email, addr , addrDetail, domain, tld, tel1,tel2,tel3  ; 
	private int zipCode;
	private String birth;
	public ModifyInfoDTO() {
		super();
	}
	public ModifyInfoDTO(String id, String name, String tel, String email, String addr, String addrDetail,
			String domain, String tld, String tel1, String tel2, String tel3, int zipCode, String birth) {
		super();
		this.id = id;
		this.name = name;
		this.tel = tel;
		this.email = email;
		this.addr = addr;
		this.addrDetail = addrDetail;
		this.domain = domain;
		this.tld = tld;
		this.tel1 = tel1;
		this.tel2 = tel2;
		this.tel3 = tel3;
		this.zipCode = zipCode;
		this.birth = birth;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public String getDomain() {
		domain=email.substring(0,email.lastIndexOf("@"));
		return domain;
	}
	public void setDomain(String domain) {
		this.domain = domain;
	}
	public String getTld() {
		tld=email.substring(email.lastIndexOf("@")+1);
		return tld;
	}
	public void setTld(String tld) {
		this.tld = tld;
	}
	public String getTel1() {
		tel1 = tel.substring(0,3);
		return tel1;
	}
	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}
	public String getTel2() {
		tel2 = tel.substring(4,8);
		return tel2;
	}
	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}
	public String getTel3() {
		tel3 = tel.substring(9);
		return tel3;
	}
	public void setTel3(String tel3) {
		this.tel3 = tel3;
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
		return "ModifyInfoDTO [id=" + id + ", name=" + name + ", tel=" + tel + ", email=" + email + ", addr=" + addr
				+ ", addrDetail=" + addrDetail + ", domain=" + domain + ", tld=" + tld + ", tel1=" + tel1 + ", tel2="
				+ tel2 + ", tel3=" + tel3 + ", zipCode=" + zipCode + ", birth=" + birth + "]";
	}

	
}
