package kr.co.viva.mypage;

public class PersonalDTO {
	private int type; //1, 성인 2,청소년 3,어린이
	private int num;
	public PersonalDTO() {
		super();
	}
	public PersonalDTO(int type, int num) {
		super();
		this.type = type;
		this.num = num;
	}
	public int getType() {
		return type;
	}
	public void setType(int type) {
		this.type = type;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "PersonalDTO [type=" + type + ", num=" + num + "]";
	}
	
	
	
}

