package kr.co.viva.giftShop;

public class GiftShopDTO {
	private int giftNum,giftType;
	private String giftName,giftTime,gitfTel,giftGoods,giftLoc,giftLocImg,giftPrev,giftBg;
	private String giftExplain;
	
	
	public GiftShopDTO() {
	
	}


	public GiftShopDTO(int giftNum, int giftType, String giftName, String giftTime, String gitfTel, String giftGoods,
			String giftLoc, String giftLocImg, String giftPrev, String giftBg, String giftExplain) {
		this.giftNum = giftNum;
		this.giftType = giftType;
		this.giftName = giftName;
		this.giftTime = giftTime;
		this.gitfTel = gitfTel;
		this.giftGoods = giftGoods;
		this.giftLoc = giftLoc;
		this.giftLocImg = giftLocImg;
		this.giftPrev = giftPrev;
		this.giftBg = giftBg;
		this.giftExplain = giftExplain;
	}


	public int getGiftNum() {
		return giftNum;
	}


	public void setGiftNum(int giftNum) {
		this.giftNum = giftNum;
	}


	public int getGiftType() {
		return giftType;
	}


	public void setGiftType(int giftType) {
		this.giftType = giftType;
	}


	public String getGiftName() {
		return giftName;
	}


	public void setGiftName(String giftName) {
		this.giftName = giftName;
	}


	public String getGiftTime() {
		return giftTime;
	}


	public void setGiftTime(String giftTime) {
		this.giftTime = giftTime;
	}


	public String getGitfTel() {
		return gitfTel;
	}


	public void setGitfTel(String gitfTel) {
		this.gitfTel = gitfTel;
	}


	public String getGiftGoods() {
		return giftGoods;
	}


	public void setGiftGoods(String giftGoods) {
		this.giftGoods = giftGoods;
	}


	public String getGiftLoc() {
		return giftLoc;
	}


	public void setGiftLoc(String giftLoc) {
		this.giftLoc = giftLoc;
	}


	public String getGiftLocImg() {
		return giftLocImg;
	}


	public void setGiftLocImg(String giftLocImg) {
		this.giftLocImg = giftLocImg;
	}


	public String getGiftPrev() {
		return giftPrev;
	}


	public void setGiftPrev(String giftPrev) {
		this.giftPrev = giftPrev;
	}


	public String getGiftBg() {
		return giftBg;
	}


	public void setGiftBg(String giftBg) {
		this.giftBg = giftBg;
	}


	public String getGiftExplain() {
		return giftExplain;
	}


	public void setGiftExplain(String giftExplain) {
		this.giftExplain = giftExplain;
	}

	@Override
	public String toString() {
		return "GiftShopDTO [giftNum=" + giftNum + ", giftType=" + giftType + ", giftName=" + giftName + ", giftTime="
				+ giftTime + ", gitfTel=" + gitfTel + ", giftGoods=" + giftGoods + ", giftLoc=" + giftLoc
				+ ", giftLocImg=" + giftLocImg + ", giftPrev=" + giftPrev + ", giftBg=" + giftBg + ", giftExplain="
				+ giftExplain + "]";
	}
	
	

	
}//class
