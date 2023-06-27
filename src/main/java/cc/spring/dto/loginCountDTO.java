package cc.spring.dto;

import java.sql.Timestamp;

public class loginCountDTO {
	private int memberCode;
	private Timestamp loginDate;
	
	public loginCountDTO() {
		super();
	}
	
	public loginCountDTO(int memberCode, Timestamp loginDate) {
		super();
		this.memberCode = memberCode;
		this.loginDate = loginDate;
	}
	
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public Timestamp getLoignDate() {
		return loginDate;
	}
	public void setLoignDate(Timestamp loginDate) {
		this.loginDate = loginDate;
	}
	
	
}
