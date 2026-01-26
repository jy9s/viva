package kr.co.viva.notice;

public class NoticeDTO {
	private String title, category, msg, inputDate, num;

	public NoticeDTO() {
		super();
	}

	public NoticeDTO(String title, String category, String msg, String inputDate, String num) {
		super();
		this.title = title;
		this.category = category;
		this.msg = msg;
		this.inputDate = inputDate;
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getInputDate() {
		return inputDate;
	}

	public void setInputDate(String inputDate) {
		this.inputDate = inputDate;
	}

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "NoticeDTO [title=" + title + ", category=" + category + ", msg=" + msg + ", inputDate=" + inputDate
				+ ", num=" + num + "]";
	}
	
	
}
