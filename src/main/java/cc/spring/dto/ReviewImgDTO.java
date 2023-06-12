package cc.spring.dto;

public class ReviewImgDTO {
private int code;
private int postcode;
private String path;
private String oriname;
private String sysname;
public ReviewImgDTO() {};
public ReviewImgDTO(int code, int postcode, String path, String oriname, String sysname) {
	super();
	this.code = code;
	this.postcode = postcode;
	this.path = path;
	this.oriname = oriname;
	this.sysname = sysname;
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
public String getPath() {
	return path;
}
public void setPath(String path) {
	this.path = path;
}
public String getOriname() {
	return oriname;
}
public void setOriname(String oriname) {
	this.oriname = oriname;
}
public String getSysname() {
	return sysname;
}
public void setSysname(String sysname) {
	this.sysname = sysname;
}

}
