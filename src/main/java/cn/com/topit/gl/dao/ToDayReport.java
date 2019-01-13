package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class ToDayReport implements GenericPojo, java.io.Serializable{
	private Long id;
	private Long consumeAreaId;
	private String consumeAreaName;
	private Long consumerId;
	private String consumerName;
	private Long paymentTypeId;
	private String paymentName;
	private Double consumeAmount;
	private Date consumeTo;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Long getConsumeAreaId() {
		return consumeAreaId;
	}
	public void setConsumeAreaId(Long consumeAreaId) {
		this.consumeAreaId = consumeAreaId;
	}
	public String getConsumeAreaName() {
		return consumeAreaName;
	}
	public void setConsumeAreaName(String consumeAreaName) {
		this.consumeAreaName = consumeAreaName;
	}
	public Long getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(Long consumerId) {
		this.consumerId = consumerId;
	}
	public String getConsumerName() {
		return consumerName;
	}
	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}
	public Long getPaymentTypeId() {
		return paymentTypeId;
	}
	public void setPaymentTypeId(Long paymentTypeId) {
		this.paymentTypeId = paymentTypeId;
	}
	
	public String getPaymentName() {
		return paymentName;
	}
	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}
	public Double getConsumeAmount() {
		return consumeAmount;
	}
	public void setConsumeAmount(Double consumeAmount) {
		this.consumeAmount = consumeAmount;
	}
	public Date getConsumeTo() {
		return consumeTo;
	}
	public void setConsumeTo(Date consumeTo) {
		this.consumeTo = consumeTo;
	}
	
}
