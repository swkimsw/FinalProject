package cc.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardAnnouncementDTO {
	private int code;
	private int boardKindCode;
	private int headLineCode;
	private int memberCode;
	private String title;
	private String content;
	private int viewCount;
	private int likeCount;
	private Timestamp regDate;
	private Timestamp modDate;
	private Timestamp delDate; //
	private String memberId;
	private String memberName;
	public BoardAnnouncementDTO() {};
	public BoardAnnouncementDTO(int code, int boardKindCode, int headLineCode, int memberCode, String title,
			String content, int viewCount, int likeCount, Timestamp regDate, Timestamp modDate, Timestamp delDate) {
		super();
		this.code = code;
		this.boardKindCode = boardKindCode;
		this.headLineCode = headLineCode;
		this.memberCode = memberCode;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.likeCount = likeCount;
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
	}
	public BoardAnnouncementDTO(int code, int boardKindCode, int headLineCode, int memberCode, String title,
			String content, int viewCount, int likeCount, Timestamp regDate, Timestamp modDate, Timestamp delDate, String memberId , String memberName) {
		super();
		this.code = code;
		this.boardKindCode = boardKindCode;
		this.headLineCode = headLineCode;
		this.memberCode = memberCode;
		this.title = title;
		this.content = content;
		this.viewCount = viewCount;
		this.likeCount = likeCount;
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
		this.memberId = memberId;
		this.memberName = memberName;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getBoardKindCode() {
		return boardKindCode;
	}
	public void setBoardKindCode(int boardKindCode) {
		this.boardKindCode = boardKindCode;
	}
	public int getHeadLineCode() {
		return headLineCode;
	}
	public void setHeadLineCode(int headLineCode) {
		this.headLineCode = headLineCode;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getViewCount() {
		return viewCount;
	}
	public void setViewCount(int viewCount) {
		this.viewCount = viewCount;
	}
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public String getRegDate() {
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy.MM.dd");
		return formatter.format(regDate);
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
	public String getMemberId() {
		return memberId;
	}
	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}

	
}
