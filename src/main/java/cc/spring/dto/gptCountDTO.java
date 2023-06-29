package cc.spring.dto;

public class gptCountDTO {
	private int memberCode;
	private int mealSuccess;
	private int mealFail;
	private int basketSuccess;
	private int basketFail;
	private int mealSuccessTotal;
	private int mealFailTotal;
	
	public gptCountDTO() {
		super();
	}

	public gptCountDTO(int memberCode, int mealSuccess, int mealFail, int basketSuccess, int basketFail) {
		super();
		this.memberCode = memberCode;
		this.mealSuccess = mealSuccess;
		this.mealFail = mealFail;
		this.basketSuccess = basketSuccess;
		this.basketFail = basketFail;
	}
	
	public gptCountDTO(int mealSuccessTotal, int mealFailTotal) {
		super();
		this.mealSuccessTotal = mealSuccessTotal;
		this.mealFailTotal = mealFailTotal;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getMealSuccess() {
		return mealSuccess;
	}

	public void setMealSuccess(int mealSuccess) {
		this.mealSuccess = mealSuccess;
	}

	public int getMealFail() {
		return mealFail;
	}

	public void setMealFail(int mealFail) {
		this.mealFail = mealFail;
	}

	public int getBasketSuccess() {
		return basketSuccess;
	}

	public void setBasketSuccess(int basketSuccess) {
		this.basketSuccess = basketSuccess;
	}

	public int getBasketFail() {
		return basketFail;
	}

	public void setBasketFail(int basketFail) {
		this.basketFail = basketFail;
	}

	public int getMealSuccessTotal() {
		return mealSuccessTotal;
	}

	public void setMealSuccessTotal(int mealSuccessTotal) {
		this.mealSuccessTotal = mealSuccessTotal;
	}

	public int getMealFailTotal() {
		return mealFailTotal;
	}

	public void setMealFailTotal(int mealFailTotal) {
		this.mealFailTotal = mealFailTotal;
	}
}
