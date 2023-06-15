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
	private int likecout;
	private Timestamp regdate;
	private Timestamp moddate;
	private Timestamp deldate;
	public BoardAnnouncementDTO() {};
	public BoardAnnouncementDTO(int code, int boardkindcode, int headlinecode, int clientcode, String title,
			String content, int viewcount, int likecout, Timestamp regdate, Timestamp moddate, Timestamp deldate) {
		super();
		this.code = code;
		this.boardkindcode = boardkindcode;
		this.headlinecode = headlinecode;
		this.clientcode = clientcode;
		this.title = title;
		this.content = content;
		this.viewcount = viewcount;
		this.likecout = likecout;
		this.regdate = regdate;
		this.moddate = moddate;
		this.deldate = deldate;
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
	public int getLikecout() {
		return likecout;
	}
	public void setLikecout(int likecout) {
		this.likecout = likecout;
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
}
