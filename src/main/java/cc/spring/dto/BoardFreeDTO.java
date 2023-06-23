package cc.spring.dto;

import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class BoardFreeDTO {
private int code;
private int boardKindCode;
private String boardKindValue;
private int headLineCode;
private String headLineValue;
private int memberCode;
private String title;
private String content;
private int viewCount;
private int likeCount;
private Timestamp regDate;
private Timestamp modDate;
private Timestamp delDate;//
private String memberId;
private String memberNickName;
private String memberCompanyName;
private int memberAuthGradeCode;
public BoardFreeDTO() {};
public BoardFreeDTO(int code, int boardKindCode, int headLineCode, int memberCode, String title, String content,
		int viewCount, int likeCount, Timestamp regDate, Timestamp modDate, Timestamp delDate) {
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
public BoardFreeDTO(int code, int boardKindCode, int headLineCode, int memberCode, String title, String content,
		int viewCount, int likeCount, Timestamp regDate, Timestamp modDate, Timestamp delDate,String memberId , String memberNickName, String memberCompanyName, int memberAuthGradeCode) {
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
	this.memberNickName = memberNickName;
	this.memberCompanyName = memberCompanyName;
	this.memberAuthGradeCode = memberAuthGradeCode;
}

public BoardFreeDTO(String boardKindValue, String headLineValue, int memberCode, String title, int viewCount,
		int likeCount, Timestamp regDate) {
	super();
	this.boardKindValue = boardKindValue;
	this.headLineValue = headLineValue;
	this.memberCode = memberCode;
	this.title = title;
	this.viewCount = viewCount;
	this.likeCount = likeCount;
	this.regDate = regDate;
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
public String getBoardKindValue() {
	return boardKindValue;
}
public void setBoardKindValue(String boardKindValue) {
	this.boardKindValue = boardKindValue;
}
public int getHeadLineCode() {
	return headLineCode;
}
public void setHeadLineCode(int headLineCode) {
	this.headLineCode = headLineCode;
}
public String getHeadLineValue() {
	return headLineValue;
}
public void setHeadLineValue(String headLineValue) {
	this.headLineValue = headLineValue;
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
public String getMemberNickName() {
	return memberNickName;
}
public void setMemberNickName(String memberNickName) {
	this.memberNickName = memberNickName;
}
public String getMemberCompanyName() {
	return memberCompanyName;
}
public void setMemberCompanyName(String memberCompanyName) {
	this.memberCompanyName = memberCompanyName;
}
public int getMemberAuthGradeCode() {
	return memberAuthGradeCode;
}
public void setMemberAuthGradeCode(int memberAuthGradeCode) {
	this.memberAuthGradeCode = memberAuthGradeCode;
}


}
