package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class Serve implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;
	private java.lang.Integer state;
	private java.lang.Integer serviceType;
	private java.lang.String name;
	private java.lang.Long phone;
	private java.lang.String eMail;
	private Date data;
	private java.lang.String demandDescription;
	private String memo;
	private String result;
	private Long amenderId;
	private String amender;
	
	public Long getAmenderId() {
		return amenderId;
	}
	public void setAmenderId(Long amenderId) {
		this.amenderId = amenderId;
	}
	public String getAmender() {
		return amender;
	}
	public void setAmender(String amender) {
		this.amender = amender;
	}
	public String getResult() {
		return result;
	}
	public void setResult(String result) {
		this.result = result;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		this.id = id;
	}
	public java.lang.Integer getState() {
		return state;
	}
	public void setState(java.lang.Integer state) {
		this.state = state;
	}
	public java.lang.Integer getServiceType() {
		return serviceType;
	}
	public void setServiceType(java.lang.Integer serviceType) {
		this.serviceType = serviceType;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	public java.lang.Long getPhone() {
		return phone;
	}
	public void setPhone(java.lang.Long phone) {
		this.phone = phone;
	}
	public java.lang.String geteMail() {
		return eMail;
	}
	public void seteMail(java.lang.String eMail) {
		this.eMail = eMail;
	}
	public Date getData() {
		return data;
	}
	public void setData(Date data) {
		this.data = data;
	}
	public java.lang.String getDemandDescription() {
		return demandDescription;
	}
	public void setDemandDescription(java.lang.String demandDescription) {
		this.demandDescription = demandDescription;
	}
}
