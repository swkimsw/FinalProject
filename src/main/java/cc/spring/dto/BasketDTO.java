package cc.spring.dto;

public class BasketDTO {

	private int code;
	private int memberCode;
	private String name;
	private int statusCode;
	
	public BasketDTO() {
		super();
	}

	public BasketDTO(int code, int memberCode, String name, int statusCode) {
		super();
		this.code = code;
		this.memberCode = memberCode;
		this.name = name;
		this.statusCode = statusCode;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getStatusCode() {
		return statusCode;
	}

	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
	}

	@Override
	public String toString() {
		return "BasketDTO [code=" + code + ", memberCode=" + memberCode + ", name=" + name + ", statusCode="
				+ statusCode + "]";
	}
	
}
