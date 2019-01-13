package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class ConsumeRecord implements GenericPojo, java.io.Serializable {
	private Long id;

	private Long consumeTypeId;
	private Date consumeFrom;
	private Date consumeTo;
	private Long consumerId;
	private Long bookingId;
	private Boolean balance;
	private Long relatedId;
	private Double consumeAmount;
	private Integer relatedType;
	private Long paymentTypeId;
	private String usersName;
	private Long consumeAreaId;
	private Integer number;
	
	public Long getConsumeAreaId() {
		return consumeAreaId;
	}
	public void setConsumeAreaId(Long consumeAreaId) {
		this.consumeAreaId = consumeAreaId;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getRelatedId() {
		return relatedId;
	}
	public void setRelatedId(Long relatedId) {
		this.relatedId = relatedId;
	}
	public Long getConsumeTypeId() {
		return consumeTypeId;
	}
	public void setConsumeTypeId(Long consumeTypeId) {
		this.consumeTypeId = consumeTypeId;
	}
	public Date getConsumeFrom() {
		return consumeFrom;
	}
	public void setConsumeFrom(Date consumeFrom) {
		this.consumeFrom = consumeFrom;
	}
	public Date getConsumeTo() {
		return consumeTo;
	}
	public void setConsumeTo(Date consumeTo) {
		this.consumeTo = consumeTo;
	}
	public Long getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(Long consumerId) {
		this.consumerId = consumerId;
	}
	public Long getBookingId() {
		return bookingId;
	}
	public void setBookingId(Long bookingId) {
		this.bookingId = bookingId;
	}
	public Boolean getBalance() {
		return balance;
	}
	public void setBalance(Boolean balance) {
		this.balance = balance;
	}
	public Double getConsumeAmount() {
		return consumeAmount;
	}
	public void setConsumeAmount(Double consumeAmount) {
		this.consumeAmount = consumeAmount;
	}
	public Integer getRelatedType() {
		return relatedType;
	}
	public void setRelatedType(Integer relatedType) {
		this.relatedType = relatedType;
	}
	public Long getPaymentTypeId() {
		return paymentTypeId;
	}
	public void setPaymentTypeId(Long paymentTypeId) {
		this.paymentTypeId = paymentTypeId;
	}
	public String getUsersName() {
		return usersName;
	}
	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	
	
	
	
	/*
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	private java.lang.Integer consumeType;

	public java.lang.Integer getConsumeType() {
		return this.consumeType;
	}

	public void setConsumeType(java.lang.Integer consumeType) {
		this.consumeType = consumeType;
	}

	private java.util.Date consumeFrom;

	public java.util.Date getConsumeFrom() {
		return this.consumeFrom;
	}

	public void setConsumeFrom(java.util.Date consumeFrom) {
		this.consumeFrom = consumeFrom;
	}

	private java.util.Date consumeTo;

	public java.util.Date getConsumeTo() {
		return this.consumeTo;
	}

	public void setConsumeTo(java.util.Date consumeTo) {
		this.consumeTo = consumeTo;
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

	private Double consumeAmount;

	public ConsumeRecord() {
	}

	public Double getConsumeAmount() {
		return consumeAmount;
	}

	public void setConsumeAmount(Double consumeAmount) {
		this.consumeAmount = consumeAmount;
	}

	private Integer relatedType;

	public Integer getRelatedType() {
		return relatedType;
	}

	public void setRelatedType(Integer relatedType) {
		this.relatedType = relatedType;
	}
	*/
}
