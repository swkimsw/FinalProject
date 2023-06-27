package cc.spring.dto;

public class gptCountDTO {
	private int memberCode;
	private int mealCount;
	private int mealSucess;
	private int mealFail;
	private int basketCount;
	private int basketSucess;
	private int basketFail;
	
	public gptCountDTO() {
		super();
	}

	public gptCountDTO(int memberCode, int mealCount, int mealSucess, int mealFail, int basketCount, int basketSucess,
			int basketFail) {
		super();
		this.memberCode = memberCode;
		this.mealCount = mealCount;
		this.mealSucess = mealSucess;
		this.mealFail = mealFail;
		this.basketCount = basketCount;
		this.basketSucess = basketSucess;
		this.basketFail = basketFail;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getMealCount() {
		return mealCount;
	}

	public void setMealCount(int mealCount) {
		this.mealCount = mealCount;
	}

	public int getMealSucess() {
		return mealSucess;
	}

	public void setMealSucess(int mealSucess) {
		this.mealSucess = mealSucess;
	}

	public int getMealFail() {
		return mealFail;
	}

	public void setMealFail(int mealFail) {
		this.mealFail = mealFail;
	}

	public int getBasketCount() {
		return basketCount;
	}

	public void setBasketCount(int basketCount) {
		this.basketCount = basketCount;
	}

	public int getBasketSucess() {
		return basketSucess;
	}

	public void setBasketSucess(int basketSucess) {
		this.basketSucess = basketSucess;
	}

	public int getBasketFail() {
		return basketFail;
	}

	public void setBasketFail(int basketFail) {
		this.basketFail = basketFail;
	}
	
	
}
