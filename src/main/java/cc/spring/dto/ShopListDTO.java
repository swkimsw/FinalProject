package cc.spring.dto;

import java.sql.Timestamp;

public class ShopListDTO {
	private int code;
	private Timestamp deadLine;
	private int dDay;
	private String title;
	private String productName;
	private String productPrice;
	private String companyName;
	private String imgCode;
	private String path;
	private String sysName;
	
	public ShopListDTO() {}
	//메인 목록용 생성자
	public ShopListDTO(int code,int dDay,String title,String productPrice,String companyName,String imgCode,String path,String sysName ) {
		super();
		this.code=code;
		this.dDay = dDay;
		this.title = title;
		this.productPrice = productPrice;
		this.companyName = companyName;
		this.imgCode = imgCode;
		this.path = path;
		this.sysName = sysName;
	}
	//검색용 생성자
	public ShopListDTO(int code,int dDay,String title,String productName,String productPrice,String companyName,String imgCode,String path,String sysName ) {
		super();
		this.code=code;
		this.dDay = dDay;
		this.title = title;
		this.productName = productName;
		this.productPrice = productPrice;
		this.companyName = companyName;
		this.imgCode = imgCode;
		this.path = path;
		this.sysName = sysName;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public Timestamp getDeadLine() {
		return deadLine;
	}
	public void setDeadLine(Timestamp deadLine) {
		this.deadLine = deadLine;
	}
	
	public int getdDay() {
		return dDay;
	}
	public void setdDay(int dDay) {
		this.dDay = dDay;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
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
	public String getImgCode() {
		return imgCode;
	}
	public void setImgCode(String imgCode) {
		this.imgCode = imgCode;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public String getSysName() {
		return sysName;
	}
	public void setSysName(String sysName) {
		this.sysName = sysName;
	}
	@Override
	public String toString() {
		return "ShopListDTO [code=" + code + ", deadLine=" + deadLine + ", dDay=" + dDay + ", title="
				+ title + ", productPrice=" + productPrice + ", companyName=" + companyName + ", imgCode=" + imgCode
				+ ", path=" + path + ", sysName=" + sysName + "]";
	}

	
	
	

	
}
