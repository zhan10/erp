package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class VBookingList implements GenericPojo, java.io.Serializable {
	
	private java.lang.Long id;
    private java.lang.Long buildingId;
    private java.lang.String buildingName;
    private java.lang.String code;
    private java.lang.Long consumerId;
    private java.lang.String consumerName;
    private java.lang.Double total;
    private java.lang.Long areaId;
    private java.lang.Integer status;
    private java.util.Date bookingTime;
    private java.lang.String areaName;
    private java.lang.Long cityId;
    private java.lang.String cityName;
    private java.lang.Long bookingId;
    private java.lang.String floorName;
    private java.lang.String name;
    private java.lang.String certificateCode;
    private java.util.Date dateFrom;
    private java.util.Date dateTo;
    private java.lang.Integer productType;
    private java.lang.Integer state;
    private java.lang.Long badge;
	public java.lang.Long getBadge() {
		return badge;
	}
	public void setBadge(java.lang.Long badge) {
		this.badge = badge;
	}
	public java.lang.Integer getState() {
		return state;
	}
	public void setState(java.lang.Integer state) {
		this.state = state;
	}
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		this.id = id;
	}
	public java.lang.Long getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(java.lang.Long buildingId) {
		this.buildingId = buildingId;
	}
	public java.lang.String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(java.lang.String buildingName) {
		this.buildingName = buildingName;
	}
	public java.lang.String getCode() {
		return code;
	}
	public void setCode(java.lang.String code) {
		this.code = code;
	}
	public java.lang.Long getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(java.lang.Long consumerId) {
		this.consumerId = consumerId;
	}
	public java.lang.String getConsumerName() {
		return consumerName;
	}
	public void setConsumerName(java.lang.String consumerName) {
		this.consumerName = consumerName;
	}
	public java.lang.Double getTotal() {
		return total;
	}
	public void setTotal(java.lang.Double total) {
		this.total = total;
	}
	public java.lang.Long getAreaId() {
		return areaId;
	}
	public void setAreaId(java.lang.Long areaId) {
		this.areaId = areaId;
	}
	public java.lang.Integer getStatus() {
		return status;
	}
	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}
	public java.util.Date getBookingTime() {
		return bookingTime;
	}
	public void setBookingTime(java.util.Date bookingTime) {
		this.bookingTime = bookingTime;
	}
	public java.lang.String getAreaName() {
		return areaName;
	}
	public void setAreaName(java.lang.String areaName) {
		this.areaName = areaName;
	}
	public java.lang.Long getCityId() {
		return cityId;
	}
	public void setCityId(java.lang.Long cityId) {
		this.cityId = cityId;
	}
	public java.lang.String getCityName() {
		return cityName;
	}
	public void setCityName(java.lang.String cityName) {
		this.cityName = cityName;
	}
	public java.lang.Long getBookingId() {
		return bookingId;
	}
	public void setBookingId(java.lang.Long bookingId) {
		this.bookingId = bookingId;
	}
	public java.lang.String getFloorName() {
		return floorName;
	}
	public void setFloorName(java.lang.String floorName) {
		this.floorName = floorName;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	public java.lang.String getCertificateCode() {
		return certificateCode;
	}
	public void setCertificateCode(java.lang.String certificateCode) {
		this.certificateCode = certificateCode;
	}
	public java.util.Date getDateFrom() {
		return dateFrom;
	}
	public void setDateFrom(java.util.Date dateFrom) {
		this.dateFrom = dateFrom;
	}
	public java.util.Date getDateTo() {
		return dateTo;
	}
	public void setDateTo(java.util.Date dateTo) {
		this.dateTo = dateTo;
	}
	public java.lang.Integer getProductType() {
		return productType;
	}
	public void setProductType(java.lang.Integer productType) {
		this.productType = productType;
	}
    
}
