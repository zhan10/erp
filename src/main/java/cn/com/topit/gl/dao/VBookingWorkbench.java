package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class VBookingWorkbench implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	private java.lang.Boolean balance;

	public java.lang.Boolean getBalance() {
		return this.balance;
	}

	public void setBalance(java.lang.Boolean balance) {
		this.balance = balance;
	}

	private java.lang.String code;

	public java.lang.String getCode() {
		return this.code;
	}

	public void setCode(java.lang.String code) {
		this.code = code;
	}

	private java.util.Date dateFrom;

	public java.util.Date getDateFrom() {
		return this.dateFrom;
	}

	public void setDateFrom(java.util.Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	private java.util.Date dateTo;

	public java.util.Date getDateTo() {
		return this.dateTo;
	}

	public void setDateTo(java.util.Date dateTo) {
		this.dateTo = dateTo;
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

	private java.lang.String buildingName;

	public java.lang.String getBuildingName() {
		return this.buildingName;
	}

	public void setBuildingName(java.lang.String buildingName) {
		this.buildingName = buildingName;
	}

	private java.lang.String floorName;

	public java.lang.String getFloorName() {
		return this.floorName;
	}

	public void setFloorName(java.lang.String floorName) {
		this.floorName = floorName;
	}

	private java.lang.String workbenchName;

	public java.lang.String getWorkbenchName() {
		return this.workbenchName;
	}

	public void setWorkbenchName(java.lang.String workbenchName) {
		this.workbenchName = workbenchName;
	}

	private java.lang.String consumerName;

	public java.lang.String getConsumerName() {
		return this.consumerName;
	}

	public void setConsumerName(java.lang.String consumerName) {
		this.consumerName = consumerName;
	}

	private Double total;

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	private Double price;

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	private java.lang.Long floorId;

	public java.lang.Long getFloorId() {
		return this.floorId;
	}

	public void setFloorId(java.lang.Long floorId) {
		this.floorId = floorId;
	}

	private java.lang.Long workbenchId;

	public java.lang.Long getWorkbenchId() {
		return this.workbenchId;
	}

	public void setWorkbenchId(java.lang.Long workbenchId) {
		this.workbenchId = workbenchId;
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

	private java.lang.Long buildingId;

	public java.lang.Long getBuildingId() {
		return this.buildingId;
	}

	public void setBuildingId(java.lang.Long buildingId) {
		this.buildingId = buildingId;
	}

	private java.lang.Long areaId;

	public java.lang.Long getAreaId() {
		return this.areaId;
	}

	public void setAreaId(java.lang.Long areaId) {
		this.areaId = areaId;
	}

	private java.lang.Long cityId;

	public java.lang.Long getCityId() {
		return this.cityId;
	}

	public void setCityId(java.lang.Long cityId) {
		this.cityId = cityId;
	}

	public VBookingWorkbench() {
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
	private Double consumerFund;

	public Double getConsumerFund() {
		return consumerFund;
	}

	public void setConsumerFund(Double consumerFund) {
		this.consumerFund = consumerFund;
	}
	private java.lang.Integer state;
	public java.lang.Integer getState() {
		return state;
	}
	public void setState(java.lang.Integer state) {
		this.state = state;
	}
	private java.lang.Long badge;
	public java.lang.Long getBadge() {
		return badge;
	}
	public void setBadge(java.lang.Long badge) {
		this.badge = badge;
	}
	private java.lang.Long typeId;

	public java.lang.Long getTypeId() {
		return typeId;
	}

	public void setTypeId(java.lang.Long typeId) {
		this.typeId = typeId;
	}
	
	private java.lang.String workbenchType;

	public java.lang.String getWorkbenchType() {
		return workbenchType;
	}

	public void setWorkbenchType(java.lang.String workbenchType) {
		this.workbenchType = workbenchType;
	}
}
