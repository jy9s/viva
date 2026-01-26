package kr.co.viva.mypage;

public class MypageDTO {
	private String name;
	private int num;
	public MypageDTO() {
		super();
	}
	public MypageDTO(String name, int num) {
		super();
		this.name = name;
		this.num = num;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	@Override
	public String toString() {
		return "MypageDTO [name=" + name + ", num=" + num + "]";
	}
		
	
}

