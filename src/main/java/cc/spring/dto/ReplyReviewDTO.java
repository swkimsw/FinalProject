package cc.spring.dto;

import java.sql.Timestamp;

public class ReplyReviewDTO {
	private int code;
	private int postCode;
	private int memberCode;
	private String nickName;
	private String companyName;
	private String content;
	private int likeCount;
	private Timestamp redDate;
	private Timestamp modDate;
	private Timestamp delDate;
	
	
	public ReplyReviewDTO() {
	}
	
	// 댓글 삽입용
	public ReplyReviewDTO(int code, int postCode, int memberCode, String content,
			int likeCount, Timestamp redDate, Timestamp modDate, Timestamp delDate) {
		super();
		this.code = code;
		this.postCode = postCode;
		this.memberCode = memberCode;
		this.content = content;
		this.likeCount = likeCount;
		this.redDate = redDate;
		this.modDate = modDate;
		this.delDate = delDate;
	}
	
	// 댓글 불러오기용
	public ReplyReviewDTO(int code, int postCode, int memberCode, String nickName, String companyName, String content,
			int likeCount, Timestamp redDate, Timestamp modDate, Timestamp delDate) {
		super();
		this.code = code;
		this.postCode = postCode;
		this.memberCode = memberCode;
		this.nickName = nickName;
		this.companyName = companyName;
		this.content = content;
		this.likeCount = likeCount;
		this.redDate = redDate;
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
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public Timestamp getRedDate() {
		return redDate;
	}
	public void setRedDate(Timestamp redDate) {
		this.redDate = redDate;
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
