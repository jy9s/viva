package kr.co.viva.restaurant;

public class RestaurantDTO {
	
	private int restaurantNum,restaurantType;
	
	private String restaurantName,restaurantTime,restaurantTel,restaurantGoods,restaurantOperTime,
	restaurantPrice,restaurantExpian,restaurantLoc,restaurantLocImg,restaurantPerv,restaurantBg
	,restaurantTypeStr;

	public RestaurantDTO() {
	}

	public RestaurantDTO(int restaurantNum, int restaurantType, String restaurantName, String restaurantTime,
			String restaurantTel, String restaurantGoods, String restaurantOperTime, String restaurantPrice,
			String restaurantExpian, String restaurantLoc, String restaurantLocImg, String restaurantPerv,
			String restaurantBg, String restaurantTypeStr) {
		this.restaurantNum = restaurantNum;
		this.restaurantType = restaurantType;
		this.restaurantName = restaurantName;
		this.restaurantTime = restaurantTime;
		this.restaurantTel = restaurantTel;
		this.restaurantGoods = restaurantGoods;
		this.restaurantOperTime = restaurantOperTime;
		this.restaurantPrice = restaurantPrice;
		this.restaurantExpian = restaurantExpian;
		this.restaurantLoc = restaurantLoc;
		this.restaurantLocImg = restaurantLocImg;
		this.restaurantPerv = restaurantPerv;
		this.restaurantBg = restaurantBg;
		this.restaurantTypeStr = restaurantTypeStr;
	}


	public int getRestaurantType() {
		return restaurantType;
	}

	public void setRestaurantType(int restaurantType) {
		this.restaurantType = restaurantType;
	}

	public String getRestaurantTypeStr() {
		String[] typeStr= {"한식","중식","양식","간식"};
		int tempType = restaurantType;
		if(!(tempType>0&&tempType<5)) {
			tempType=4;
			
		}//end if 
		restaurantTypeStr=typeStr[tempType-1];

		return restaurantTypeStr;
	}

	public void setRestaurantTypeStr(String restaurantTypeStr) {
		this.restaurantTypeStr = restaurantTypeStr;
	}

	public int getRestaurantNum() {
		return restaurantNum;
	}

	public void setRestaurantNum(int restaurantNum) {
		this.restaurantNum = restaurantNum;
	}

	
	public String getRestaurantName() {
		return restaurantName;
	}

	public void setRestaurantName(String restaurantName) {
		this.restaurantName = restaurantName;
	}

	public String getRestaurantTime() {
		return restaurantTime;
	}

	public void setRestaurantTime(String restaurantTime) {
		this.restaurantTime = restaurantTime;
	}

	public String getRestaurantTel() {
		return restaurantTel;
	}

	public void setRestaurantTel(String restaurantTel) {
		this.restaurantTel = restaurantTel;
	}

	public String getRestaurantGoods() {
		return restaurantGoods;
	}

	public void setRestaurantGoods(String restaurantGoods) {
		this.restaurantGoods = restaurantGoods;
	}

	public String getRestaurantOperTime() {
		return restaurantOperTime;
	}

	public void setRestaurantOperTime(String restaurantOperTime) {
		this.restaurantOperTime = restaurantOperTime;
	}

	public String getRestaurantPrice() {
		return restaurantPrice;
	}

	public void setRestaurantPrice(String restaurantPrice) {
		this.restaurantPrice = restaurantPrice;
	}

	public String getRestaurantExpian() {
		return restaurantExpian;
	}

	public void setRestaurantExpian(String restaurantExpian) {
		this.restaurantExpian = restaurantExpian;
	}

	public String getRestaurantLoc() {
		return restaurantLoc;
	}

	public void setRestaurantLoc(String restaurantLoc) {
		this.restaurantLoc = restaurantLoc;
	}

	public String getRestaurantLocImg() {
		return restaurantLocImg;
	}

	public void setRestaurantLocImg(String restaurantLocImg) {
		this.restaurantLocImg = restaurantLocImg;
	}

	public String getRestaurantPerv() {
		return restaurantPerv;
	}

	public void setRestaurantPerv(String restaurantPerv) {
		this.restaurantPerv = restaurantPerv;
	}

	public String getRestaurantBg() {
		return restaurantBg;
	}

	public void setRestaurantBg(String restaurantBg) {
		this.restaurantBg = restaurantBg;
	}



	@Override
	public String toString() {
		return "RestaurantDTO [restaurantNum=" + restaurantNum + ", restaurantType=" + restaurantType
				+ ", restaurantName=" + restaurantName + ", restaurantTime=" + restaurantTime + ", restaurantTel="
				+ restaurantTel + ", restaurantGoods=" + restaurantGoods + ", restaurantOperTime=" + restaurantOperTime
				+ ", restaurantPrice=" + restaurantPrice + ", restaurantExpian=" + restaurantExpian + ", restaurantLoc="
				+ restaurantLoc + ", restaurantLocImg=" + restaurantLocImg + ", restaurantPerv=" + restaurantPerv
				+ ", restaurantBg=" + restaurantBg + "]";
	}
	
	

	
	
	
	
	
	
	
	
	

}
