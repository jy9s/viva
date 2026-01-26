package kr.co.viva.attr;


public class AttractionDTO {
	private int attracNum,attracCapac;
	private String attracName,attracExplian,attracHeight,attracLocImg,attracLoc;
	private String attracPrev,attracBg,attracBg2,attracState;
	private String attracOperDate;
	
	public AttractionDTO() {
	}

	public AttractionDTO(int attracNum, int attracCapac, String attracName, String attracExplian, String attracHeight,
			String attracLocImg, String attracLoc, String attracPrev, String attracBg, String attracBg2,
			String attracState, String attracOperDate) {
		super();
		this.attracNum = attracNum;
		this.attracCapac = attracCapac;
		this.attracName = attracName;
		this.attracExplian = attracExplian;
		this.attracHeight = attracHeight;
		this.attracLocImg = attracLocImg;
		this.attracLoc = attracLoc;
		this.attracPrev = attracPrev;
		this.attracBg = attracBg;
		this.attracBg2 = attracBg2;
		this.attracState = attracState;
		this.attracOperDate = attracOperDate;
	}

	public int getAttracNum() {
		return attracNum;
	}

	public void setAttracNum(int attracNum) {
		this.attracNum = attracNum;
	}

	public int getAttracCapac() {
		return attracCapac;
	}

	public void setAttracCapac(int attracCapac) {
		this.attracCapac = attracCapac;
	}

	public String getAttracName() {
		return attracName;
	}

	public void setAttracName(String attracName) {
		this.attracName = attracName;
	}

	public String getAttracExplian() {
		return attracExplian;
	}

	public void setAttracExplian(String attracExplian) {
		this.attracExplian = attracExplian;
	}

	public String getAttracHeight() {
		return attracHeight;
	}

	public void setAttracHeight(String attracHeight) {
		this.attracHeight = attracHeight;
	}

	public String getAttracLocImg() {
		return attracLocImg;
	}

	public void setAttracLocImg(String attracLocImg) {
		this.attracLocImg = attracLocImg;
	}

	public String getAttracLoc() {
		return attracLoc;
	}

	public void setAttracLoc(String attracLoc) {
		this.attracLoc = attracLoc;
	}

	public String getAttracPrev() {
		return attracPrev;
	}

	public void setAttracPrev(String attracPrev) {
		this.attracPrev = attracPrev;
	}

	public String getAttracBg() {
		return attracBg;
	}

	public void setAttracBg(String attracBg) {
		this.attracBg = attracBg;
	}

	public String getAttracBg2() {
		return attracBg2;
	}

	public void setAttracBg2(String attracBg2) {
		this.attracBg2 = attracBg2;
	}

	public String getAttracState() {
		return attracState;
	}

	public void setAttracState(String attracState) {
		this.attracState = attracState;
	}

	public String getAttracOperDate() {
		return attracOperDate;
	}

	public void setAttracOperDate(String attracOperDate) {
		this.attracOperDate = attracOperDate;
	}

	@Override
	public String toString() {
		return "AttractionDTO [attracNum=" + attracNum + ", attracCapac=" + attracCapac + ", attracName=" + attracName
				+ ", attracExplian=" + attracExplian + ", attracHeight=" + attracHeight + ", attracLocImg="
				+ attracLocImg + ", attracLoc=" + attracLoc + ", attracPrev=" + attracPrev + ", attracBg=" + attracBg
				+ ", attracBg2=" + attracBg2 + ", attracState=" + attracState + ", attracOperDate=" + attracOperDate
				+ "]";
	}

	
	
	
	
	
	
	
	
}
