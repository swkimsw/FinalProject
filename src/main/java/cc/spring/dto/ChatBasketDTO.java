package cc.spring.dto;

import java.util.Arrays;

public class ChatBasketDTO {
	private String meal;
	private String[] ingredients;
	
	public ChatBasketDTO() {
		super();
	}
	public ChatBasketDTO(String meal, String[] ingredients) {
		this.meal = meal;
		this.ingredients = ingredients;
	}
	public String getmeal() {
		return meal;
	}
	public void setmeal(String meal) {
		this.meal = meal;
	}
	public String[] getIngredients() {
		return ingredients;
	}
	public void setIngredients(String[] ingredients) {
		this.ingredients = ingredients;
	}
	
	@Override
	public String toString() {
		return "ChatBasketDTO [meal=" + meal + ", ingredients=" + Arrays.toString(ingredients) + "]";
	}
}
