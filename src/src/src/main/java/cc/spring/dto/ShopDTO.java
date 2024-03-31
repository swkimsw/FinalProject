package cc.spring.dto;

import java.sql.Timestamp;

public class ShopDTO {
	
	private int code;
	private int memberCode;
	private int statusCode;
	private Timestamp deadLine;
	private String deadLineTemp;
	private int total;
	private int min;
	private String title;
	private String detail;
	private String productName;
	private String productPrice;
	private int boardKindCode;
	private Timestamp regDate;
	private Timestamp modDate;
	private Timestamp delDate;
	
	private String businessId;
	
	public ShopDTO() {}
	public ShopDTO(int code, int memberCode, int statusCode, Timestamp deadLine, String deadLineTemp, int total, int min,
			String title, String detail, String productName, String productPrice, int boardKindCode, Timestamp regDate,
			Timestamp modDate, Timestamp delDate, String businessId) {
		super();
		this.code = code;
		this.memberCode = memberCode;
		this.statusCode = statusCode;
		this.deadLine = deadLine;
		this.deadLineTemp = deadLineTemp;
		this.total = total;
		this.min = min;
		this.title = title;
		this.detail = detail;
		this.productName = productName;
		this.productPrice = productPrice;
		this.boardKindCode = boardKindCode;
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
		this.businessId = businessId;
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

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
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

	public int getTotal() {
		return total;
	}

	public void setTotal(int total) {
		this.total = total;
	}

	public int getMin() {
		return min;
	}

	public void setMin(int min) {
		this.min = min;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDetail() {
		return detail;
	}

	public void setDetail(String detail) {
		this.detail = detail;
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

	public int getBoardKindCode() {
		return boardKindCode;
	}

	public void setBoardKindCode(int boardKindCode) {
		this.boardKindCode = boardKindCode;
	}

	public Timestamp getRegDate() {
		return regDate;
	}

	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}

	public Timestamp getModDate() {
		return modDate;
	}

	public void setModDate(Timestamp modDate) {
		this.modDate = modDate;
	}

	public Timestamp getDelDate() {
		return delDate;
	}

	public void setDelDate(Timestamp delDate) {
		this.delDate = delDate;
	}

	public String getBusinessId() {
		return businessId;
	}

	public void setBusinessId(String businessId) {
		this.businessId = businessId;
	}	
	
}
