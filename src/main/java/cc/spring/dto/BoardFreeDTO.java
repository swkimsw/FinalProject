package cc.spring.dto;

import java.sql.Timestamp;

public class BoardFreeDTO {
private int code;
private int boardkindcode;
private int headlinecode;
private int membercode;
private String title;
private String content;
private int viewcount;
private int likecount;
private Timestamp regdate;
private Timestamp moddate;
private Timestamp deldate;
private String client_id;
private String client_nickname;
private String business_name;
public BoardFreeDTO() {};
public BoardFreeDTO(int code, int boardkindcode, int headlinecode, int membercode, String title, String content,
		int viewcount, int likecount, Timestamp regdate, Timestamp moddate, Timestamp deldate) {
	super();
	this.code = code;
	this.boardkindcode = boardkindcode;
	this.headlinecode = headlinecode;
	this.membercode = membercode;
	this.title = title;
	this.content = content;
	this.viewcount = viewcount;
	this.likecount = likecount;
	this.regdate = regdate;
	this.moddate = moddate;
	this.deldate = deldate;
}
public BoardFreeDTO(int code, int boardkindcode, int headlinecode, int membercode, String title, String content,
		int viewcount, int likecount, Timestamp regdate, Timestamp moddate, Timestamp deldate,String client_id, String client_nickname, String business_name) {
	super();
	this.code = code;
	this.boardkindcode = boardkindcode;
	this.headlinecode = headlinecode;
	this.membercode = membercode;
	this.title = title;
	this.content = content;
	this.viewcount = viewcount;
	this.likecount = likecount;
	this.regdate = regdate;
	this.moddate = moddate;
	this.deldate = deldate;
	this.client_id = client_id;
	this.client_nickname = client_nickname;
	this.business_name = business_name;
}
public int getCode() {
	return code;
}
public void setCode(int code) {
	this.code = code;
}
public int getBoardkindcode() {
	return boardkindcode;
}
public void setBoardkindcode(int boardkindcode) {
	this.boardkindcode = boardkindcode;
}
public int getHeadlinecode() {
	return headlinecode;
}
public void setHeadlinecode(int headlinecode) {
	this.headlinecode = headlinecode;
}
public int getMembercode() {
	return membercode;
}
public void setMembercode(int membercode) {
	this.membercode = membercode;
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
public int getViewcount() {
	return viewcount;
}
public void setViewcount(int viewcount) {
	this.viewcount = viewcount;
}
public int getLikecount() {
	return likecount;
}
public void setLikecount(int likecount) {
	this.likecount = likecount;
}
public Timestamp getRegdate() {
	return regdate;
}
public void setRegdate(Timestamp regdate) {
	this.regdate = regdate;
}
public Timestamp getModdate() {
	return moddate;
}
public void setModdate(Timestamp moddate) {
	this.moddate = moddate;
}
public Timestamp getDeldate() {
	return deldate;
}
public void setDeldate(Timestamp deldate) {
	this.deldate = deldate;
}
public String getClient_id() {
	return client_id;
}
public void setClient_id(String client_id) {
	this.client_id = client_id;
}
public String getClient_nickname() {
	return client_nickname;
}
public void setClient_nickname(String client_nickname) {
	this.client_nickname = client_nickname;
}
public String getBusiness_name() {
	return business_name;
}
public void setBusiness_name(String business_name) {
	this.business_name = business_name;
}

}
