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
}
