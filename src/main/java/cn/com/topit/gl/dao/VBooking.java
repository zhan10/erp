package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class VBooking implements GenericPojo, java.io.Serializable {
	
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	private java.lang.Integer status;

	public java.lang.Integer getStatus() {
		return this.status;
	}

	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}

	private java.lang.String buildingName;

	public java.lang.String getBuildingName() {
		return this.buildingName;
	}

	public void setBuildingName(java.lang.String buildingName) {
		this.buildingName = buildingName;
	}

	private java.lang.String cityName;

	public java.lang.String getCityName() {
		return this.cityName;
	}

	public void setCityName(java.lang.String cityName) {
		this.cityName = cityName;
	}

	private java.lang.String areaName;

	public java.lang.String getAreaName() {
		return this.areaName;
	}

	public void setAreaName(java.lang.String areaName) {
		this.areaName = areaName;
	}

	private java.lang.String code;

	public java.lang.String getCode() {
		return this.code;
	}

	public void setCode(java.lang.String code) {
		this.code = code;
	}

	private java.lang.Integer persons;

	public java.lang.Integer getPersons() {
		return this.persons;
	}

	public void setPersons(java.lang.Integer persons) {
		this.persons = persons;
	}

	private Date bookingTime;

	public Date getBookingTime() {
		return this.bookingTime;
	}

	public void setBookingTime(Date bookingTime) {
		this.bookingTime = bookingTime;
	}

	private java.lang.String consumerName;

	public java.lang.String getConsumerName() {
		return this.consumerName;
	}

	public void setConsumerName(java.lang.String consumerName) {
		this.consumerName = consumerName;
	}

	private java.lang.String tel;

	public java.lang.String getTel() {
		return this.tel;
	}

	public void setTel(java.lang.String tel) {
		this.tel = tel;
	}

	private java.lang.Long consumerId;

	public java.lang.Long getConsumerId() {
		return this.consumerId;
	}

	public void setConsumerId(java.lang.Long consumerId) {
		this.consumerId = consumerId;
	}

	private java.lang.Long areaId;

	public java.lang.Long getAreaId() {
		return this.areaId;
	}

	public void setAreaId(java.lang.Long areaId) {
		this.areaId = areaId;
	}

	private java.lang.Long buildingId;

	public java.lang.Long getBuildingId() {
		return this.buildingId;
	}

	public void setBuildingId(java.lang.Long buildingId) {
		this.buildingId = buildingId;
	}

	public VBooking() {
	}

	private Double total;

	public Double getTotal() {
		return total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	private java.lang.Boolean balance;

	public java.lang.Boolean getBalance() {
		return this.balance;
	}

	public void setBalance(java.lang.Boolean balance) {
		this.balance = balance;
	}

	private Double balancePrice;
	private Date balanceTime;

	public Double getBalancePrice() {
		return balancePrice;
	}

	public void setBalancePrice(Double balancePrice) {
		this.balancePrice = balancePrice;
	}

	public Date getBalanceTime() {
		return balanceTime;
	}

	public void setBalanceTime(Date balanceTime) {
		this.balanceTime = balanceTime;
	}

	private String email;

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	private String backReason;

	public String getBackReason() {
		return backReason;
	}

	public void setBackReason(String backReason) {
		this.backReason = backReason;
	}
	private Double originalCost;
	private Date amendTime;
	private String amenderId;
	private String amender;

	public Double getOriginalCost() {
		return originalCost;
	}

	public void setOriginalCost(Double originalCost) {
		this.originalCost = originalCost;
	}

	public Date getAmendTime() {
		return amendTime;
	}

	public void setAmendTime(Date amendTime) {
		this.amendTime = amendTime;
	}

	public String getAmenderId() {
		return amenderId;
	}

	public void setAmenderId(String amenderId) {
		this.amenderId = amenderId;
	}

	public String getAmender() {
		return amender;
	}

	public void setAmender(String amender) {
		this.amender = amender;
	}
	private Double deposit;

	public Double getDeposit() {
		return deposit;
	}

	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}
	
	public String contractCode;

	public String getContractCode() {
		return contractCode;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	
}
