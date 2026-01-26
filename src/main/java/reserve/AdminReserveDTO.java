package reserve;

import java.util.Date;

public class AdminReserveDTO {
	private int resNum, resCount, resPrice, resPayInfoNum, resInstallment;
	private String resName, resId, resTel, resPayMethod, resRefund, resProduct, resPayAgency;
	private Date resPayDate;
	
	
	public AdminReserveDTO() {
		super();
	}


	public AdminReserveDTO(int resNum, int resCount, int resPrice, int resPayInfoNum, int resInstallment,
			String resName, String resId, String resTel, String resPayMethod, String resRefund, String resProduct,
			String resPayAgency, Date resPayDate) {
		super();
		this.resNum = resNum;
		this.resCount = resCount;
		this.resPrice = resPrice;
		this.resPayInfoNum = resPayInfoNum;
		this.resInstallment = resInstallment;
		this.resName = resName;
		this.resId = resId;
		this.resTel = resTel;
		this.resPayMethod = resPayMethod;
		this.resRefund = resRefund;
		this.resProduct = resProduct;
		this.resPayAgency = resPayAgency;
		this.resPayDate = resPayDate;
	}


	public int getResNum() {
		return resNum;
	}

	public void setResNum(int resNum) {
		this.resNum = resNum;
	}


	public int getResCount() {
		return resCount;
	}


	public void setResCount(int resCount) {
		this.resCount = resCount;
	}



	public int getResPrice() {
		return resPrice;
	}



	public void setResPrice(int resPrice) {
		this.resPrice = resPrice;
	}



	public int getResPayInfoNum() {
		return resPayInfoNum;
	}


	public void setResPayInfoNum(int resPayInfoNum) {
		this.resPayInfoNum = resPayInfoNum;
	}



	public int getResInstallment() {
		return resInstallment;
	}



	public void setResInstallment(int resInstallment) {
		this.resInstallment = resInstallment;
	}




	public String getResName() {
		return resName;
	}






	public void setResName(String resName) {
		this.resName = resName;
	}






	public String getResId() {
		return resId;
	}






	public void setResId(String resId) {
		this.resId = resId;
	}






	public String getResTel() {
		return resTel;
	}






	public void setResTel(String resTel) {
		this.resTel = resTel;
	}






	public String getResPayMethod() {
		return resPayMethod;
	}






	public void setResPayMethod(String resPayMethod) {
		this.resPayMethod = resPayMethod;
	}






	public String getResRefund() {
		return resRefund;
	}






	public void setResRefund(String resRefund) {
		this.resRefund = resRefund;
	}






	public String getResProduct() {
		return resProduct;
	}






	public void setResProduct(String resProduct) {
		this.resProduct = resProduct;
	}






	public String getResPayAgency() {
		return resPayAgency;
	}






	public void setResPayAgency(String resPayAgency) {
		this.resPayAgency = resPayAgency;
	}






	public Date getResPayDate() {
		return resPayDate;
	}






	public void setResPayDate(Date resPayDate) {
		this.resPayDate = resPayDate;
	}






	@Override
	public String toString() {
		return "AdminPerfReserveDTO [resNum=" + resNum + ", resCount=" + resCount + ", resPrice=" + resPrice
				+ ", resPayInfoNum=" + resPayInfoNum + ", resInstallment=" + resInstallment + ", resName=" + resName
				+ ", resId=" + resId + ", resTel=" + resTel + ", resPayMethod=" + resPayMethod + ", resRefund="
				+ resRefund + ", resProduct=" + resProduct + ", resPayAgency=" + resPayAgency + ", resPayDate="
				+ resPayDate + "]";
	}
	
	
	
}
