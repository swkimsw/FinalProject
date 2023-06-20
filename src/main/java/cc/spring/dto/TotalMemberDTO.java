package cc.spring.dto;

public class TotalMemberDTO {
private int code;
private int clientmember;
private int businessmember;
private int authgradecode;
public TotalMemberDTO () {};
public TotalMemberDTO(int code, int clientmember, int businessmember, int authgradecode) {
	super();
	this.code = code;
	this.clientmember = clientmember;
	this.businessmember = businessmember;
	this.authgradecode = authgradecode;
}
public int getCode() {
	return code;
}
public void setCode(int code) {
	this.code = code;
}
public int getClientmember() {
	return clientmember;
}
public void setClientmember(int clientmember) {
	this.clientmember = clientmember;
}
public int getBusinessmember() {
	return businessmember;
}
public void setBusinessmember(int businessmember) {
	this.businessmember = businessmember;
}
public int getAuthgradecode() {
	return authgradecode;
}
public void setAuthgradecode(int authgradecode) {
	this.authgradecode = authgradecode;
}

}
