package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class Marketing implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;
	private java.lang.Integer statusBit;
	private java.lang.Integer status;
	private java.lang.String name;
	private java.lang.String creater;
	private Date openTime;
	private Date startTime;
	private Date endTime;
	private java.lang.Integer type;
	private java.lang.Double coupon;
	private java.lang.String memo;
	private java.lang.String conditionSetting;
	private java.lang.String pic;
	private java.lang.Integer priority;
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		this.id = id;
	}
	public java.lang.Integer getStatusBit() {
		return statusBit;
	}
	public void setStatusBit(java.lang.Integer statusBit) {
		this.statusBit = statusBit;
	}
	public java.lang.Integer getStatus() {
		return status;
	}
	public void setStatus(java.lang.Integer status) {
		this.status = status;
	}
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	public java.lang.String getCreater() {
		return creater;
	}
	public void setCreater(java.lang.String creater) {
		this.creater = creater;
	}
	public Date getOpenTime() {
		return openTime;
	}
	public void setOpenTime(Date openTime) {
		this.openTime = openTime;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public java.lang.Integer getType() {
		return type;
	}
	public void setType(java.lang.Integer type) {
		this.type = type;
	}
	public java.lang.Double getCoupon() {
		return coupon;
	}
	public void setCoupon(java.lang.Double coupon) {
		this.coupon = coupon;
	}
	public java.lang.String getMemo() {
		return memo;
	}
	public void setMemo(java.lang.String memo) {
		this.memo = memo;
	}
	public java.lang.String getConditionSetting() {
		return conditionSetting;
	}
	public void setConditionSetting(java.lang.String conditionSetting) {
		this.conditionSetting = conditionSetting;
	}
	public java.lang.String getPic() {
		return pic;
	}
	public void setPic(java.lang.String pic) {
		this.pic = pic;
	}
	public java.lang.Integer getPriority() {
		return priority;
	}
	public void setPriority(java.lang.Integer priority) {
		this.priority = priority;
	}
	public Marketing() {
	}
}
