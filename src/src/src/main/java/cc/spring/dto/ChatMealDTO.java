package cc.spring.dto;

import java.util.Arrays;

public class ChatMealDTO {
	private String[] breakfast;
	private String[] lunch;
	private String[] dinner;
	
	public ChatMealDTO() {
		super();
	}

	public ChatMealDTO(String[] breakfast, String[] lunch, String[] dinner) {
		super();
		this.breakfast = breakfast;
		this.lunch = lunch;
		this.dinner = dinner;
	}

	public String[] getBreakfast() {
		return breakfast;
	}

	public void setBreakfast(String[] breakfast) {
		this.breakfast = breakfast;
	}

	public String[] getLunch() {
		return lunch;
	}

	public void setLunch(String[] lunch) {
		this.lunch = lunch;
	}

	public String[] getDinner() {
		return dinner;
	}

	public void setDinner(String[] dinner) {
		this.dinner = dinner;
	}

	@Override
	public String toString() {
		return "ChatDTO [breakfast=" + Arrays.toString(breakfast) + ", lunch=" + Arrays.toString(lunch) + ", dinner="
				+ Arrays.toString(dinner) + "]";
	}
}
