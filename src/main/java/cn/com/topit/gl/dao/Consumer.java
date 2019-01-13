package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class Consumer implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	private java.lang.Integer type;

	public java.lang.Integer getType() {
		return this.type;
	}

	public void setType(java.lang.Integer type) {
		this.type = type;
	}

	private java.lang.Integer points;

	public java.lang.Integer getPoints() {
		return this.points;
	}

	public void setPoints(java.lang.Integer points) {
		this.points = points;
	}

	private java.lang.String name;

	public java.lang.String getName() {
		return this.name;
	}

	public void setName(java.lang.String name) {
		this.name = name;
	}

	private java.lang.String loginName;

	public java.lang.String getLoginName() {
		return this.loginName;
	}

	public void setLoginName(java.lang.String loginName) {
		this.loginName = loginName;
	}

	private java.lang.String pwd;

	public java.lang.String getPwd() {
		return this.pwd;
	}

	public void setPwd(java.lang.String pwd) {
		this.pwd = pwd;
	}

	private java.lang.String tel;

	public java.lang.String getTel() {
		return this.tel;
	}

	public void setTel(java.lang.String tel) {
		this.tel = tel;
	}

	private java.lang.String email;

	public java.lang.String getEmail() {
		return this.email;
	}

	public void setEmail(java.lang.String email) {
		this.email = email;
	}

	private java.lang.String address;

	public java.lang.String getAddress() {
		return this.address;
	}

	public void setAddress(java.lang.String address) {
		this.address = address;
	}

	private java.lang.Integer certificate;

	public java.lang.Integer getCertificate() {
		return this.certificate;
	}

	public void setCertificate(java.lang.Integer certificate) {
		this.certificate = certificate;
	}

	private java.lang.String certificateCode;

	public java.lang.String getCertificateCode() {
		return this.certificateCode;
	}

	public void setCertificateCode(java.lang.String certificateCode) {
		this.certificateCode = certificateCode;
	}

	private java.lang.Integer cardType;

	public java.lang.Integer getCardType() {
		return this.cardType;
	}

	public void setCardType(java.lang.Integer cardType) {
		this.cardType = cardType;
	}

	private java.lang.String cardCode;

	public java.lang.String getCardCode() {
		return this.cardCode;
	}

	public void setCardCode(java.lang.String cardCode) {
		this.cardCode = cardCode;
	}

	private java.lang.Boolean balance;

	public java.lang.Boolean getBalance() {
		return this.balance;
	}

	public void setBalance(java.lang.Boolean balance) {
		this.balance = balance;
	}

	private java.lang.String pic;

	public java.lang.String getPic() {
		return this.pic;
	}

	public void setPic(java.lang.String pic) {
		this.pic = pic;
	}

	public Consumer() {
	}

	private java.util.Date birth;

	public java.util.Date getBirth() {
		return this.birth;
	}

	public void setBirth(java.util.Date birth) {
		this.birth = birth;
	}

	private java.lang.Boolean sex;

	public java.lang.Boolean getSex() {
		return this.sex;
	}

	public void setSex(java.lang.Boolean sex) {
		this.sex = sex;
	}

	private Double fund;

	public Double getFund() {
		return fund;
	}

	public void setFund(Double fund) {
		this.fund = fund;
	}
	
	private String officeAddress;

	public String getOfficeAddress() {
		return officeAddress;
	}

	public void setOfficeAddress(String officeAddress) {
		this.officeAddress = officeAddress;
	}
}
