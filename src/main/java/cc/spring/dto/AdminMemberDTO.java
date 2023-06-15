package cc.spring.dto;

public class AdminMemberDTO {
	private int code;
	private String id;
	private String pw;
	private String name;
	private String authGradeCode;
	
	
	public AdminMemberDTO() {
	}
	public AdminMemberDTO(int code, String id, String pw, String name, String authGradeCode) {
		this.code = code;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.authGradeCode = authGradeCode;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAuthGradeCode() {
		return authGradeCode;
	}
	public void setAuthGradeCode(String authGradeCode) {
		this.authGradeCode = authGradeCode;
	}
	
	
}
