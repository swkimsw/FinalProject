package cc.spring.dto;

import java.sql.Timestamp;

public class ReportDTO {
	private int code;
	private int postcode; // o
	private int replyCode; 
	private int boardKindCode; // o
	private int reportKindCode; // o 
	private int reporterCode;// o
	private int reporteeCode;// o
	private String detail;// o
	private int statusCode;// o
	private Timestamp regDate;
	private Timestamp modDate;
	private Timestamp delDate;
	public ReportDTO() {};
	public ReportDTO(int code, int postcode, int replyCode, int boardKindCode, int reportKindCode, int reporterCode,
			int reporteeCode, String detail, int statusCode, Timestamp regDate, Timestamp modDate, Timestamp delDate) {
		super();
		this.code = code;
		this.postcode = postcode;
		this.replyCode = replyCode;
		this.boardKindCode = boardKindCode;
		this.reportKindCode = reportKindCode;
		this.reporterCode = reporterCode;
		this.reporteeCode = reporteeCode;
		this.detail = detail;
		this.statusCode = statusCode;
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
	public int getPostcode() {
		return postcode;
	}
	public void setPostcode(int postcode) {
		this.postcode = postcode;
	}
	public int getReplyCode() {
		return replyCode;
	}
	public void setReplyCode(int replyCode) {
		this.replyCode = replyCode;
	}
	public int getBoardKindCode() {
		return boardKindCode;
	}
	public void setBoardKindCode(int boardKindCode) {
		this.boardKindCode = boardKindCode;
	}
	public int getReportKindCode() {
		return reportKindCode;
	}
	public void setReportKindCode(int reportKindCode) {
		this.reportKindCode = reportKindCode;
	}
	public int getReporterCode() {
		return reporterCode;
	}
	public void setReporterCode(int reporterCode) {
		this.reporterCode = reporterCode;
	}
	public int getReporteeCode() {
		return reporteeCode;
	}
	public void setReporteeCode(int reporteeCode) {
		this.reporteeCode = reporteeCode;
	}
	public String getDetail() {
		return detail;
	}
	public void setDetail(String detail) {
		this.detail = detail;
	}
	public int getStatusCode() {
		return statusCode;
	}
	public void setStatusCode(int statusCode) {
		this.statusCode = statusCode;
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
