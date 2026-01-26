package kr.co.viva.operate;

public class OperateServiceDTO {

	private int attracNum;
	private String attracName,attracPreview,oprateState;
	
	public OperateServiceDTO() {
	}

	public OperateServiceDTO(int attracNum, String attracName, String attracPreview, String oprateState) {
		this.attracNum = attracNum;
		this.attracName = attracName;
		this.attracPreview = attracPreview;
		this.oprateState = oprateState;
	}

	public int getAttracNum() {
		return attracNum;
	}

	public void setAttracNum(int attracNum) {
		this.attracNum = attracNum;
	}

	public String getAttracName() {
		return attracName;
	}

	public void setAttracName(String attracName) {
		this.attracName = attracName;
	}

	public String getAttracPreview() {
		return attracPreview;
	}

	public void setAttracPreview(String attracPreview) {
		this.attracPreview = attracPreview;
	}

	public String getOprateState() {
		return oprateState;
	}

	public void setOprateState(String oprateState) {
		this.oprateState = oprateState;
	}

	@Override
	public String toString() {
		return "OperateServiceDTO [attracNum=" + attracNum + ", attracName=" + attracName + ", attracPreview="
				+ attracPreview + ", oprateState=" + oprateState + "]";
	}
	
	
	
	
	
	
	
}