package kr.co.viva.faq;

public class FaqDTO {
	private String title, category, msg,	 num;

	public FaqDTO() {
		super();
	}

	public FaqDTO(String title, String category, String msg, String num) {
		super();
		this.title = title;
		this.category = category;
		this.msg = msg;
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

	public String getNum() {
		return num;
	}

	public void setNum(String num) {
		this.num = num;
	}

	@Override
	public String toString() {
		return "FaqDTO [title=" + title + ", category=" + category + ", msg=" + msg + ", num=" + num + "]";
	}


	
}
