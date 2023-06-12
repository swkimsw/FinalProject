package cc.spring.dto;

import java.sql.Timestamp;

public class ClientMemberDTO {
	private int code;
	private String id;
	private String pw;
	private String name;
	private String nickName;
	private String birthDate;
	private String phone;
	private String eMail;
	private String zipcode;
	private String address1;
	private String address2;
	private String agree;
	private int authGradeCode;
	private Timestamp regDate;
	private Timestamp modDate;
	private Timestamp delDate;
	
	
	public ClientMemberDTO() {

	}
	public ClientMemberDTO(int code, String id, String pw, String name, String nickName, String birthDate, String phone,
			String eMail, String zipcode, String address1, String address2, String agree, int authGradeCode,
			Timestamp regDate, Timestamp modDate, Timestamp delDate) {
		this.code = code;
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.nickName = nickName;
		this.birthDate = birthDate;
		this.phone = phone;
		this.eMail = eMail;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.agree = agree;
		this.authGradeCode = authGradeCode;
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
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getBirthDate() {
		return birthDate;
	}
	public void setBirthDate(String birthDate) {
		this.birthDate = birthDate;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String geteMail() {
		return eMail;
	}
	public void seteMail(String eMail) {
		this.eMail = eMail;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getAgree() {
		return agree;
	}
	public void setAgree(String agree) {
		this.agree = agree;
	}
	public int getAuthGradeCode() {
		return authGradeCode;
	}
	public void setAuthGradeCode(int authGradeCode) {
		this.authGradeCode = authGradeCode;
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
