package cc.spring.dto;

import java.sql.Timestamp;

public class ShopListDTO {
	private int code;
	private Timestamp deadLine;
	private int dDay;
	private int statusCode;
	private String title;
	private String productName;
	private String productPrice;
	private String companyName;
	private String imgCode;
	private String path;
	private String sysName;
	private int quantity;
	
	public ShopListDTO() {}
	
	//전체,검색,상태 생성자
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
	
	//내 공구 리스트 목록용 생성자
	public ShopListDTO(int code,int dDay,String title,String productName,String productPrice,String companyName,String imgCode,String path,String sysName,int quantity ) {
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
		this.quantity = quantity;
	}
	
	// 관리자 페이지용 공구샵 리스트 생성자
	public ShopListDTO(int code, int statusCode, String title, String productName, String companyName, String path,
			String sysName) {
		super();
		this.code = code;
		this.statusCode = statusCode;
		this.title = title;
		this.productName = productName;
		this.companyName = companyName;
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
	
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	@Override
	public String toString() {
		return "ShopListDTO [code=" + code + ", deadLine=" + deadLine + ", dDay=" + dDay + ", statusCode=" + statusCode
				+ ", title=" + title + ", productName=" + productName + ", productPrice=" + productPrice
				+ ", companyName=" + companyName + ", imgCode=" + imgCode + ", path=" + path + ", sysName=" + sysName
				+ ", quantity=" + quantity + "]";
	}
	

	
	
	

	
}
