package cc.spring.dto;

import java.sql.Timestamp;

public class RequestListDTO {
	
	private int code;
	private int clientCode;
	private int quantity;
	private int parentCode;
	private int statusCode;
	private Timestamp regDate;
	private Timestamp modDate;
	private Timestamp delDate;
	
	public RequestListDTO() {}
	
	public RequestListDTO(int clientCode, int quantity, int parentCode) {
		super();
		this.clientCode = clientCode;
		this.quantity = quantity;
		this.parentCode = parentCode;
	}

	public RequestListDTO(int code, int clientCode, int quantity, int parentCode, int statusCode, Timestamp regDate,
			Timestamp modDate, Timestamp delDate) {
		super();
		this.code = code;
		this.clientCode = clientCode;
		this.quantity = quantity;
		this.parentCode = parentCode;
		this.statusCode = statusCode;
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
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
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
	public int getParentCode() {
		return parentCode;
	}
	public void setParentCode(int parentCode) {
		this.parentCode = parentCode;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
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
	
}
