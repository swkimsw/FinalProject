package cc.spring.dto;

import java.sql.Timestamp;

public class ShopListDTO {
	private int code;
	private int businessCode;
	private Timestamp deadLine;
	private String deadLineTemp;
	private String title;
	private String productPrice;
	private String companyName;
	
	public ShopListDTO() {}
	public ShopListDTO(int code,Timestamp deadLine,String title,String productPrice,String companyName) {
		super();
		this.code=code;
		this.deadLine = deadLine;
		this.title = title;
		this.productPrice = productPrice;
		this.companyName = companyName;
	}
	
	
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getBusinessCode() {
		return businessCode;
	}
	public void setBusinessCode(int businessCode) {
		this.businessCode = businessCode;
	}
	public Timestamp getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(Timestamp deadLine) {
		this.deadLine = deadLine;
	}
	public String getDeadLineTemp() {
		return deadLineTemp;
	}
	public void setDeadLineTemp(String deadLineTemp) {
		this.deadLineTemp = deadLineTemp;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProductPrice() {
		return productPrice;
	}
	public void setProductPrice(String productPrice) {
		this.productPrice = productPrice;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	

	
}
