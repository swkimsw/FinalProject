package cc.spring.dto;

import java.sql.Timestamp;

public class MemberDTO {
	private int code;
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
	private Timestamp regDate;
	private Timestamp modDate;
	private Timestamp delDate;
	private int reportCount;
	private String strDelDate;
	private String auth;
	
	public MemberDTO() {

	}
	public MemberDTO(int code, String shippingCompany) {
		super();
		this.code = code;
		this.shippingCompany = shippingCompany;
	}
	public MemberDTO(String id, String businessId, String name, String companyName, String nickName, String eMail,
			Timestamp regDate, int reportCount) {
		super();
		this.id = id;
		this.businessId = businessId;
		this.name = name;
		this.companyName = companyName;
		this.nickName = nickName;
		this.eMail = eMail;
		this.regDate = regDate;
		this.reportCount = reportCount;
	}
	public MemberDTO(int code, String id, String businessId, String pw, String name, String companyName,
			int authGradeCode, String nickName, String birthDate, String phone, String eMail, String shippingCompany,
			String zipcode, String address1, String address2, String agree, Timestamp regDate, Timestamp modDate,
			Timestamp delDate) {
		this.code = code;
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
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
	}
	
	
	public MemberDTO(int code, String id, String businessId, String pw, String name, String companyName,
			int authGradeCode, String nickName, String birthDate, String phone, String eMail, String shippingCompany,
			String zipcode, String address1, String address2, String agree, Timestamp regDate, Timestamp modDate,
			Timestamp delDate, int reportCount, String strDelDate, String auth) {
		super();
		this.code = code;
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
		this.regDate = regDate;
		this.modDate = modDate;
		this.delDate = delDate;
		this.reportCount = reportCount;
		this.strDelDate = strDelDate;
		this.auth = auth;
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
	public int getReportCount() {
		return reportCount;
	}
	public void setReportCount(int reportCount) {
		this.reportCount = reportCount;
	}
	public String getStrDelDate() {
		return strDelDate;
	}
	public void setStrDelDate(String strDelDate) {
		this.strDelDate = strDelDate;
	}
	public String getAuth() {
		return auth;
	}
	public void setAuth(String auth) {
		this.auth = auth;
	}
	@Override
	public String toString() {
		return "MemberDTO [code=" + code + ", id=" + id + ", businessId=" + businessId + ", pw=" + pw + ", name=" + name
				+ ", companyName=" + companyName + ", authGradeCode=" + authGradeCode + ", nickName=" + nickName
				+ ", birthDate=" + birthDate + ", phone=" + phone + ", eMail=" + eMail + ", shippingCompany="
				+ shippingCompany + ", zipcode=" + zipcode + ", address1=" + address1 + ", address2=" + address2
				+ ", agree=" + agree + ", regDate=" + regDate + ", modDate=" + modDate + ", delDate=" + delDate
				+ ", reportCount=" + reportCount + ", strDelDate=" + strDelDate + ", auth=" + auth + "]";
	}
	
}
