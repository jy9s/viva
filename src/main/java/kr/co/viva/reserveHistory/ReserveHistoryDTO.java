package kr.co.viva.reserveHistory;

import java.sql.Date;

public class ReserveHistoryDTO {
	private int num,personCnt;
	private Date payDate, perfDate;
	private String title,  state;
	public ReserveHistoryDTO() {
		super();
	}
	public ReserveHistoryDTO(int num, Date payDate, Date perfDate, String title, int personCnt, String state) {
		super();
		this.num = num;
		this.payDate = payDate;
		this.perfDate = perfDate;
		this.title = title;
		this.personCnt = personCnt;
		this.state = state;
	}
	public int getNum() {
		return num;
	}
	public void setNum(int num) {
		this.num = num;
	}
	public Date getPayDate() {
		return payDate;
	}
	public void setPayDate(Date payDate) {
		this.payDate = payDate;
	}
	public Date getPerfDate() {
		return perfDate;
	}
	public void setPerfDate(Date perfDate) {
		this.perfDate = perfDate;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getPersonCnt() {
		return personCnt;
	}
	public void setPersonCnt(int personCnt) {
		this.personCnt = personCnt;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	@Override
	public String toString() {
		return "ReserveHistoryDTO [num=" + num + ", payDate=" + payDate + ", perfDate=" + perfDate + ", title=" + title
				+ ", personCnt=" + personCnt + ", state=" + state + "]";
	}
	
	
}
