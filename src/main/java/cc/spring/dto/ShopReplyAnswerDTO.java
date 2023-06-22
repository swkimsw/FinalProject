package cc.spring.dto;

import java.sql.Timestamp;

public class ShopReplyAnswerDTO {
	
	private int code;
	private int postCode;
	private int askCode;
	private int memberCode;
	private String content;
	private Timestamp regDate;
	private Timestamp modDate;
	private Timestamp delDate;
	
	public ShopReplyAnswerDTO() {}
	public ShopReplyAnswerDTO(int code, int postCode, int askCode, int memberCode, String content, Timestamp regDate,
			Timestamp modDate, Timestamp delDate) {
		super();
		this.code = code;
		this.postCode = postCode;
		this.askCode = askCode;
		this.memberCode = memberCode;
		this.content = content;
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
	public int getPostCode() {
		return postCode;
	}
	public void setPostCode(int postCode) {
		this.postCode = postCode;
	}
	public int getAskCode() {
		return askCode;
	}
	public void setAskCode(int askCode) {
		this.askCode = askCode;
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
	
}
