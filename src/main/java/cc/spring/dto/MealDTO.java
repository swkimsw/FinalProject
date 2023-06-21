package cc.spring.dto;

public class MealDTO {
	private int code;
	private String seq;
	private int memberCode;
	private String mealDate;
	private int timeCode;
	private String meal;
	
	public MealDTO() {
		super();
	}

	public MealDTO(int code, int memberCode, String mealDate, int timeCode, String meal) {
		super();
		this.code = code;
		this.memberCode = memberCode;
		this.mealDate = mealDate;
		this.timeCode = timeCode;
		this.meal = meal;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
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

	@Override
	public String toString() {
		return "MealDTO [code=" + code + ", memberCode=" + memberCode + ", mealDate=" + mealDate + ", timeCode="
				+ timeCode + ", meal=" + meal + "]";
	}
	
}
