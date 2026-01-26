package notice;

public class AdminNoticeRangeDTO {
	private int startNum, endNum; //시작번호 끝번호
	private String field, keyword; //카테고리, 키워드
	private String fieldStr;
	private String url;
	private int currentPage=1; //현재 페이지
	private int totalPage=0; //총 페이지
	
	
	
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public int getStartNum() {
		return startNum;
	}
	public void setStartNum(int startNum) {
		this.startNum = startNum;
	}
	public int getEndNum() {
		return endNum;
	}
	public void setEndNum(int endNum) {
		this.endNum = endNum;
	}
	public String getField() {
		return field;
	}
	public void setField(String field) {
		this.field = field;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	
	public String getFieldStr() {
		String[] fieldTitle = {"공지","뉴스","일반","이벤트"};
		if(field==null || field.equals("")) {
			field="1";
		}
		int tempFiled=Integer.parseInt(field);
		if(!(tempFiled>0 && tempFiled<5)) {
			tempFiled=1;
		}
		fieldStr = fieldTitle[tempFiled-1];
		return fieldStr;
	}
	@Override
	public String toString() {
		return "NoticeRangeDTO [startNum=" + startNum + ", endNum=" + endNum + ", field=" + field + ", keyword="
				+ keyword + ", fieldStr=" + fieldStr + ", url=" + url + ", currentPage=" + currentPage + ", totalPage="
				+ totalPage + "]";
	}

	
	
}
