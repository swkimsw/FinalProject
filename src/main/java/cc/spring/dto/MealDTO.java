package cc.spring.dto;

public class MealDTO {
	private int code;
	private int clientCode;
	private String mealDate;
	private int timeCode;
	private String meal;
	private int mealCount;
	
	public MealDTO() {
		super();
	}

	public MealDTO(int code, int clientCode, String mealDate, int timeCode, String meal, int mealCount) {
		super();
		this.code = code;
		this.clientCode = clientCode;
		this.mealDate = mealDate;
		this.timeCode = timeCode;
		this.meal = meal;
		this.mealCount = mealCount;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getClientCode() {
		return clientCode;
	}

	public void setClientCode(int clientCode) {
		this.clientCode = clientCode;
	}

	public String getMealDate() {
		return mealDate;
	}

	public void setMealDate(String mealDate) {
		this.mealDate = mealDate;
	}

	public int getTimeCode() {
		return timeCode;
	}

	public void setTimeCode(int timeCode) {
		this.timeCode = timeCode;
	}

	public String getMeal() {
		return meal;
	}

	public void setMeal(String meal) {
		this.meal = meal;
	}

	public int getMealCount() {
		return mealCount;
	}

	public void setMealCount(int mealCount) {
		this.mealCount = mealCount;
	}

	@Override
	public String toString() {
		return "MealDTO [code=" + code + ", clientCode=" + clientCode + ", mealDate=" + mealDate + ", timeCode="
				+ timeCode + ", meal=" + meal + ", mealCount=" + mealCount + "]";
	}
	
}
