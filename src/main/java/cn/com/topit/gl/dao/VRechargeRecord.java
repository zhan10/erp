package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class VRechargeRecord implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	private java.lang.String code;

	public java.lang.String getCode() {
		return this.code;
	}

	public void setCode(java.lang.String code) {
		this.code = code;
	}

	private java.lang.String consumerName;

	public java.lang.String getConsumerName() {
		return this.consumerName;
	}

	public void setConsumerName(java.lang.String consumerName) {
		this.consumerName = consumerName;
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

	private java.lang.String tel;

	public java.lang.String getTel() {
		return this.tel;
	}

	public void setTel(java.lang.String tel) {
		this.tel = tel;
	}

	private java.lang.String memo;

	public java.lang.String getMemo() {
		return this.memo;
	}

	public void setMemo(java.lang.String memo) {
		this.memo = memo;
	}

	private java.lang.Long consumerId;

	public java.lang.Long getConsumerId() {
		return this.consumerId;
	}

	public void setConsumerId(java.lang.Long consumerId) {
		this.consumerId = consumerId;
	}

	private java.lang.Long bookingId;

	public java.lang.Long getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(java.lang.Long bookingId) {
		this.bookingId = bookingId;
	}

	private java.lang.Long relatedId;

	public java.lang.Long getRelatedId() {
		return this.relatedId;
	}

	public void setRelatedId(java.lang.Long relatedId) {
		this.relatedId = relatedId;
	}

	public VRechargeRecord() {
	}

	private Integer relatedType;

	public Integer getRelatedType() {
		return relatedType;
	}

	public void setRelatedType(Integer relatedType) {
		this.relatedType = relatedType;
	}

	private java.lang.Integer status;

	public java.lang.Integer getStatus() {
		return status;
	}

	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}

	

	
}
