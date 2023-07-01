package cc.spring.dto;

import java.sql.Timestamp;

public class BanMemberDTO {
	private int code;
	private int memberCode;
	private String id;
	private String businessId;
	private String pw;
	private String name;
	private String companyName;
	private int authGradeCode;
	private String nickName;
	private String birthDate;
	private String phone;
	private String eMail;
	private String shippingCompany;
	private String zipcode;
	private String address1;
	private String address2;
	private String agree;
	private int reportCount;
	private Timestamp delDate;
	public BanMemberDTO() {
		super();
	}
	public BanMemberDTO(int code, int memberCode, String id, String businessId, String pw, String name,
			String companyName, int authGradeCode, String nickName, String birthDate, String phone, String eMail,
			String shippingCompany, String zipcode, String address1, String address2, String agree, int reportCount,
			Timestamp delDate) {
		super();
		this.code = code;
		this.memberCode = memberCode;
		this.id = id;
		this.businessId = businessId;
		this.pw = pw;
		this.name = name;
		this.companyName = companyName;
		this.authGradeCode = authGradeCode;
		this.nickName = nickName;
		this.birthDate = birthDate;
		this.phone = phone;
		this.eMail = eMail;
		this.shippingCompany = shippingCompany;
		this.zipcode = zipcode;
		this.address1 = address1;
		this.address2 = address2;
		this.agree = agree;
		this.reportCount = reportCount;
		this.delDate = delDate;
	}
	public int getCode() {
		return code;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public int getMemberCode() {
		return memberCode;
	}
	public void setMemberCode(int memberCode) {
		this.memberCode = memberCode;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getBusinessId() {
		return businessId;
	}
	public void setBusinessId(String businessId) {
		this.businessId = businessId;
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
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public int getAuthGradeCode() {
		return authGradeCode;
	}
	public void setAuthGradeCode(int authGradeCode) {
		this.authGradeCode = authGradeCode;
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
	public String getShippingCompany() {
		return shippingCompany;
	}
	public void setShippingCompany(String shippingCompany) {
		this.shippingCompany = shippingCompany;
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
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public Timestamp getDelDate() {
		return delDate;
	}
	public void setDelDate(Timestamp delDate) {
		this.delDate = delDate;
	}
}
