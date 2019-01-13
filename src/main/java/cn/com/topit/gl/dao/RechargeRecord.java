package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class RechargeRecord implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	private java.lang.Long consumerId;

	public java.lang.Long getConsumerId() {
		return this.consumerId;
	}

	public void setConsumerId(java.lang.Long consumerId) {
		this.consumerId = consumerId;
	}

	private java.util.Date rechargeTime;

	public java.util.Date getRechargeTime() {
		return this.rechargeTime;
	}

	public void setRechargeTime(java.util.Date rechargeTime) {
		this.rechargeTime = rechargeTime;
	}

	private java.math.BigDecimal amount;

	public java.math.BigDecimal getAmount() {
		return this.amount;
	}

	public void setAmount(java.math.BigDecimal amount) {
		this.amount = amount;
	}

	private java.lang.Long bookingId;

	public java.lang.Long getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(java.lang.Long bookingId) {
		this.bookingId = bookingId;
	}

	private java.lang.String memo;

	public java.lang.String getMemo() {
		return this.memo;
	}

	public void setMemo(java.lang.String memo) {
		this.memo = memo;
	}

	private java.lang.Long relatedId;

	public java.lang.Long getRelatedId() {
		return this.relatedId;
	}

	public void setRelatedId(java.lang.Long relatedId) {
		this.relatedId = relatedId;
	}

	public RechargeRecord() {
	}

	private Integer relatedType;

	public Integer getRelatedType() {
		return relatedType;
	}

	public void setRelatedType(Integer relatedType) {
		this.relatedType = relatedType;
	}

	private java.lang.Boolean balance;

	public java.lang.Boolean getBalance() {
		return this.balance;
	}

	public void setBalance(java.lang.Boolean balance) {
		this.balance = balance;
	}
}
