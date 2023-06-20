package cc.spring.dto;

import java.sql.Timestamp;

public class BoardAnnouncementDTO {
	private int code;
	private int boardkindcode;
	private int headlinecode;
	private int clientcode;
	private String title;
	private String content;
	private int viewcount;
	private int likecount;
	private Timestamp regdate;
	private Timestamp moddate;
	private Timestamp deldate;
	private String admin_id;
	private String admin_name;
	public BoardAnnouncementDTO() {};
	public BoardAnnouncementDTO(int code, int boardkindcode, int headlinecode, int clientcode, String title,
			String content, int viewcount, int likecount, Timestamp regdate, Timestamp moddate, Timestamp deldate) {
		super();
		this.code = code;
		this.boardkindcode = boardkindcode;
		this.headlinecode = headlinecode;
		this.clientcode = clientcode;
		this.title = title;
		this.content = content;
		this.viewcount = viewcount;
		this.likecount = likecount;
		this.regdate = regdate;
		this.moddate = moddate;
		this.deldate = deldate;
	}
	
	public BoardAnnouncementDTO(int code, int boardkindcode, int headlinecode, int clientcode, String title,
			String content, int viewcount, int likecount, Timestamp regdate, Timestamp moddate, Timestamp deldate,String admin_id , String admin_name) {
		super();
		this.code = code;
		this.boardkindcode = boardkindcode;
		this.headlinecode = headlinecode;
		this.clientcode = clientcode;
		this.title = title;
		this.content = content;
		this.viewcount = viewcount;
		this.likecount = likecount;
		this.regdate = regdate;
		this.moddate = moddate;
		this.deldate = deldate;
		this.admin_id = admin_id;
		this.admin_name = admin_name;
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
	public int getClientcode() {
		return clientcode;
	}
	public void setClientcode(int clientcode) {
		this.clientcode = clientcode;
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
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getAdmin_name() {
		return admin_name;
	}
	public void setAdmin_name(String admin_name) {
		this.admin_name = admin_name;
	}
	
	
}
