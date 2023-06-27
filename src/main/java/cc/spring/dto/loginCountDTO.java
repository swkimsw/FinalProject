package cc.spring.dto;

import java.sql.Timestamp;

public class loginCountDTO {
	private int memberCode;
	private int count;
	private Timestamp loginDate;
	
	public loginCountDTO() {
		super();
	}

	public loginCountDTO(int memberCode, int count, Timestamp loginDate) {
		super();
		this.memberCode = memberCode;
		this.count = count;
		this.loginDate = loginDate;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public int getCount() {
		return count;
	}

	public void setCount(int count) {
		this.count = count;
	}

	public Timestamp getLoginDate() {
		return loginDate;
	}

	public void setLoginDate(Timestamp loginDate) {
		this.loginDate = loginDate;
	}
	
}
