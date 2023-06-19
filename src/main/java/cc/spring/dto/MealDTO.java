package cc.spring.dto;

import java.sql.Timestamp;

public class MealDTO {
	private int code;
	private int clientCode;
	private Timestamp mealDate;
	private int timeCode;
	private String meal;
	public MealDTO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public MealDTO(int code, int clientCode, Timestamp mealDate, int timeCode, String meal) {
		super();
		this.code = code;
		this.clientCode = clientCode;
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
	public int getClientCode() {
		return clientCode;
	}
	public void setClientCode(int clientCode) {
		this.clientCode = clientCode;
	}
	public Timestamp getMealDate() {
		return mealDate;
	}
	public void setMealDate(Timestamp mealDate) {
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
	
	
}
