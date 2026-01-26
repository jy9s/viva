package attr;

public class AdminAttractionDTO {
	private int attrNum;
	private String attrName, attrExplain;
	private String attrLoc, attrHeight;
	private String attrStrDate, attrEndDate, attrState;
	private String attrMain, attrPrev, attrPrev2;
	public int getAttrNum() {
		return attrNum;
	}
	public void setAttrNum(int attrNum) {
		this.attrNum = attrNum;
	}
	public String getAttrName() {
		return attrName;
	}
	public void setAttrName(String attrName) {
		this.attrName = attrName;
	}
	public String getAttrExplain() {
		return attrExplain;
	}
	public void setAttrExplain(String attrExplain) {
		this.attrExplain = attrExplain;
	}
	public String getAttrLoc() {
		return attrLoc;
	}
	public void setAttrLoc(String attrLoc) {
		this.attrLoc = attrLoc;
	}
	public String getAttrHeight() {
		return attrHeight;
	}
	public void setAttrHeight(String attrHeight) {
		this.attrHeight = attrHeight;
	}
	public String getAttrStrDate() {
		return attrStrDate;
	}
	public void setAttrStrDate(String attrStrDate) {
		this.attrStrDate = attrStrDate;
	}
	public String getAttrEndDate() {
		return attrEndDate;
	}
	public void setAttrEndDate(String attrEndDate) {
		this.attrEndDate = attrEndDate;
	}
	public String getAttrState() {
		return attrState;
	}
	public void setAttrState(String attrState) {
		this.attrState = attrState;
	}
	public String getAttrMain() {
		return attrMain;
	}
	public void setAttrMain(String attrMain) {
		this.attrMain = attrMain;
	}
	public String getAttrPrev() {
		return attrPrev;
	}
	public void setAttrPrev(String attrPrev) {
		this.attrPrev = attrPrev;
	}
	public String getAttrPrev2() {
		return attrPrev2;
	}
	public void setAttrPrev2(String attrPrev2) {
		this.attrPrev2 = attrPrev2;
	}
	@Override
	public String toString() {
		return "AttractionDTO [attrNum=" + attrNum + ", attrName=" + attrName + ", attrExplain=" + attrExplain
				+ ", attrLoc=" + attrLoc + ", attrHeight=" + attrHeight + ", attrStrDate=" + attrStrDate
				+ ", attrEndDate=" + attrEndDate + ", attrState=" + attrState + ", attrMain=" + attrMain + ", attrPrev="
				+ attrPrev + ", attrPrev2=" + attrPrev2 + "]";
	}
	public AdminAttractionDTO(int attrNum, String attrName, String attrExplain, String attrLoc, String attrHeight,
			String attrStrDate, String attrEndDate, String attrState, String attrMain, String attrPrev,
			String attrPrev2) {
		super();
		this.attrNum = attrNum;
		this.attrName = attrName;
		this.attrExplain = attrExplain;
		this.attrLoc = attrLoc;
		this.attrHeight = attrHeight;
		this.attrStrDate = attrStrDate;
		this.attrEndDate = attrEndDate;
		this.attrState = attrState;
		this.attrMain = attrMain;
		this.attrPrev = attrPrev;
		this.attrPrev2 = attrPrev2;
	}
	public AdminAttractionDTO() {
		super();
	}

	
	
	
	
	
	
	
	
}