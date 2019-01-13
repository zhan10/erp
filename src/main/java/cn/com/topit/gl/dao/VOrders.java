package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class VOrders implements GenericPojo, java.io.Serializable {
	private String code;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

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

	private java.math.BigDecimal total;

	public java.math.BigDecimal getTotal() {
		return this.total;
	}

	public void setTotal(java.math.BigDecimal total) {
		this.total = total;
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

	private java.util.Date ordersTime;

	public java.util.Date getOrdersTime() {
		return this.ordersTime;
	}

	public void setOrdersTime(java.util.Date ordersTime) {
		this.ordersTime = ordersTime;
	}

	private String arrTime;
	
	public String getArrTime() {
		return arrTime;
	}

	public void setArrTime(String arrTime) {
		this.arrTime = arrTime;
	}

	private java.lang.String address;

	public java.lang.String getAddress() {
		return this.address;
	}

	public void setAddress(java.lang.String address) {
		this.address = address;
	}

	private java.lang.String memo;

	public java.lang.String getMemo() {
		return this.memo;
	}

	public void setMemo(java.lang.String memo) {
		this.memo = memo;
	}

	private java.lang.Long buildingId;

	public java.lang.Long getBuildingId() {
		return this.buildingId;
	}

	public void setBuildingId(java.lang.Long buildingId) {
		this.buildingId = buildingId;
	}

	private java.lang.Long bookingId;

	public java.lang.Long getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(java.lang.Long bookingId) {
		this.bookingId = bookingId;
	}

	private java.lang.Long consumerId;

	public java.lang.Long getConsumerId() {
		return this.consumerId;
	}

	public void setConsumerId(java.lang.Long consumerId) {
		this.consumerId = consumerId;
	}
	private java.lang.String name;
	
	public java.lang.String getName() {
		return name;
	}

	public void setName(java.lang.String name) {
		this.name = name;
	}
	private java.lang.String cityName;
	
	public java.lang.String getCityName() {
		return cityName;
	}

	public void setCityName(java.lang.String cityName) {
		this.cityName = cityName;
	}

	public VOrders() {
	}
}
