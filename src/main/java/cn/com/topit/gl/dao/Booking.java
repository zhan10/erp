package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class Booking implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	private java.lang.Long buildingId;

	public java.lang.Long getBuildingId() {
		return this.buildingId;
	}

	public void setBuildingId(java.lang.Long buildingId) {
		this.buildingId = buildingId;
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

	private java.lang.Integer status;

	public java.lang.Integer getStatus() {
		return this.status;
	}

	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}

	private java.lang.Long consumerId;

	public java.lang.Long getConsumerId() {
		return this.consumerId;
	}

	public void setConsumerId(java.lang.Long consumerId) {
		this.consumerId = consumerId;
	}

	public Booking() {
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
	private String backReason;

	public String getBackReason() {
		return backReason;
	}

	public void setBackReason(String backReason) {
		this.backReason = backReason;
	}
	private Double originalCost;
	private Date amendTime;
	private Long amenderId;
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
	
	private String contractCode;

	public String getContractCode() {
		return contractCode;
	}

	public void setContractCode(String contractCode) {
		this.contractCode = contractCode;
	}
	
}
