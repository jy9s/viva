package kr.co.viva.pay;

public class PersonalDTO {
	
	private int personalType, personalCnt;

	public PersonalDTO() {
		super();
	}

	public PersonalDTO(int personalType, int personalCnt) {
		super();
		this.personalType = personalType;
		this.personalCnt = personalCnt;
	}

	public int getPersonalType() {
		return personalType;
	}

	public void setPersonalType(int personalType) {
		this.personalType = personalType;
	}

	public int getPersonalCnt() {
		return personalCnt;
	}

	public void setPersonalCnt(int personalCnt) {
		this.personalCnt = personalCnt;
	}

	@Override
	public String toString() {
		return "PersonalDTO [personalType=" + personalType + ", personalCnt=" + personalCnt + "]";
	}

	
	
}
