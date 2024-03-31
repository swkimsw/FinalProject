package cc.spring.dto;

public class BoardCountDTO {

	private String regDate;
	private int cnt;
	public BoardCountDTO() {
		super();
	}
	public BoardCountDTO(String regDate, int cnt) {
		this.regDate = regDate;
		this.cnt = cnt;
	}
	public String getRegDate() {
		return regDate;
	}
	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	public int getCnt() {
		return cnt;
	}
	public void setCnt(int cnt) {
		this.cnt = cnt;
	}
}
