package cc.spring.dto;

import java.sql.Timestamp;

public class ShopReplyAskDTO {
	
	private int code;
	private int postCode;
	private int memberCode;
	private String content;
	private Timestamp regDate;
	private Timestamp modDate;
	private Timestamp delDate;
	
	private String nickName;
	
	public ShopReplyAskDTO() {}
	public ShopReplyAskDTO(int code, int postCode, int memberCode, String content, Timestamp regDate, Timestamp modDate,
			Timestamp delDate, String nickName) {
		super();
		this.code = code;
		this.postCode = postCode;
		this.memberCode = memberCode;
		this.content = content;
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
		this.nickName = nickName;
	}
	
	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public int getPostCode() {
		return postCode;
	}

	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}

	public int getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
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
	
	public String getNickName() {
		return nickName;
	}
	
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	
}
