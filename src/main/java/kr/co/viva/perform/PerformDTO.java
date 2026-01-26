package kr.co.viva.perform;

import java.sql.Date;

public class PerformDTO {
	String perfTitle, perfSubTitle, perfTime, perfPreview, perfImg,perfDelFlag;
	int perfNum, perfType,perfLoc,perfShowTime,perfPrice,member_num;
	Date perfStartDate,perfEndDate,perfInputDate;
	
	public PerformDTO() {

	}

	public PerformDTO(String perfTitle, String perfSubTitle, String perfTime, String perfPreview, String perfImg,
			String perfDelFlag, int perfNum, int perfType, int perfLoc, int perfShowTime, int perfPrice, int member_num,
			Date perfStartDate, Date perfEndDate, Date perfInputDate) {
		super();
		this.perfTitle = perfTitle;
		this.perfSubTitle = perfSubTitle;
		this.perfTime = perfTime;
		this.perfPreview = perfPreview;
		this.perfImg = perfImg;
		this.perfDelFlag = perfDelFlag;
		this.perfNum = perfNum;
		this.perfType = perfType;
		this.perfLoc = perfLoc;
		this.perfShowTime = perfShowTime;
		this.perfPrice = perfPrice;
		this.member_num = member_num;
		this.perfStartDate = perfStartDate;
		this.perfEndDate = perfEndDate;
		this.perfInputDate = perfInputDate;
	}

	public String getPerfTitle() {
		return perfTitle;
	}

	public void setPerfTitle(String perfTitle) {
		this.perfTitle = perfTitle;
	}

	public String getPerfSubTitle() {
		return perfSubTitle;
	}

	public void setPerfSubTitle(String perfSubTitle) {
		this.perfSubTitle = perfSubTitle;
	}

	public String getPerfTime() {
		return perfTime;
	}

	public void setPerfTime(String perfTime) {
		this.perfTime = perfTime;
	}

	public String getPerfPreview() {
		return perfPreview;
	}

	public void setPerfPreview(String perfPreview) {
		this.perfPreview = perfPreview;
	}

	public String getPerfImg() {
		return perfImg;
	}

	public void setPerfImg(String perfImg) {
		this.perfImg = perfImg;
	}

	public String getPerfDelFlag() {
		return perfDelFlag;
	}

	public void setPerfDelFlag(String perfDelFlag) {
		this.perfDelFlag = perfDelFlag;
	}

	public int getPerfNum() {
		return perfNum;
	}

	public void setPerfNum(int perfNum) {
		this.perfNum = perfNum;
	}

	public int getPerfType() {
		return perfType;
	}

	public void setPerfType(int perfType) {
		this.perfType = perfType;
	}

	public int getPerfLoc() {
		return perfLoc;
	}

	public void setPerfLoc(int perfLoc) {
		this.perfLoc = perfLoc;
	}

	public int getPerfShowTime() {
		return perfShowTime;
	}

	public void setPerfShowTime(int perfShowTime) {
		this.perfShowTime = perfShowTime;
	}

	public int getPerfPrice() {
		return perfPrice;
	}

	public void setPerfPrice(int perfPrice) {
		this.perfPrice = perfPrice;
	}

	public int getMember_num() {
		return member_num;
	}

	public void setMember_num(int member_num) {
		this.member_num = member_num;
	}

	public Date getPerfStartDate() {
		return perfStartDate;
	}

	public void setPerfStartDate(Date perfStartDate) {
		this.perfStartDate = perfStartDate;
	}

	public Date getPerfEndDate() {
		return perfEndDate;
	}

	public void setPerfEndDate(Date perfEndDate) {
		this.perfEndDate = perfEndDate;
	}

	public Date getPerfInputDate() {
		return perfInputDate;
	}

	public void setPerfInputDate(Date perfInputDate) {
		this.perfInputDate = perfInputDate;
	}

	@Override
	public String toString() {
		return "PerformDTO [perfTitle=" + perfTitle + ", perfSubTitle=" + perfSubTitle + ", perfTime=" + perfTime
				+ ", perfPreview=" + perfPreview + ", perfImg=" + perfImg + ", perfDelFlag=" + perfDelFlag
				+ ", perfNum=" + perfNum + ", perfType=" + perfType + ", perfLoc=" + perfLoc + ", perfShowTime="
				+ perfShowTime + ", perfPrice=" + perfPrice + ", member_num=" + member_num + ", perfStartDate="
				+ perfStartDate + ", perfEndDate=" + perfEndDate + ", perfInputDate=" + perfInputDate + "]";
	}

	
	
}
