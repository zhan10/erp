package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class RentContract implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;
	private java.lang.Long floorId;
	private java.lang.String contractNumber;
	private java.lang.Integer state;
	private java.lang.String customerName;
	private Date contractDate;
	private Date usefulLife;
	private Date validDate;
    private java.lang.Integer acreage;
	private java.lang.Integer population;
	private Double monthRent;
	private Double downPayment;
	private Double margin;
	private java.lang.String roomNumber;
	private String pic;
	public String getPic() {
		return pic;
	}
	public void setPic(String pic) {
		this.pic = pic;
	}
	private java.lang.String comment;
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		this.id = id;
	}
	public java.lang.Long getFloorId() {
		return floorId;
	}
	public void setFloorId(java.lang.Long floorId) {
		this.floorId = floorId;
	}
	public java.lang.String getContractNumber() {
		return contractNumber;
	}
	public void setContractNumber(java.lang.String contractNumber) {
		this.contractNumber = contractNumber;
	}
	public java.lang.Integer getState() {
		return state;
	}
	public void setState(java.lang.Integer state) {
		this.state = state;
	}
	public java.lang.String getCustomerName() {
		return customerName;
	}
	public void setCustomerName(java.lang.String customerName) {
		this.customerName = customerName;
	}
	public Date getContractDate() {
		return contractDate;
	}
	public void setContractDate(Date contractDate) {
		this.contractDate = contractDate;
	}
	public Date getUsefulLife() {
		return usefulLife;
	}
	public void setUsefulLife(Date usefulLife) {
		this.usefulLife = usefulLife;
	}
	public Date getValidDate() {
		return validDate;
	}
	public void setValidDate(Date validDate) {
		this.validDate = validDate;
	}
	public java.lang.Integer getAcreage() {
		return acreage;
	}
	public void setAcreage(java.lang.Integer acreage) {
		this.acreage = acreage;
	}
	public java.lang.Integer getPopulation() {
		return population;
	}
	public void setPopulation(java.lang.Integer population) {
		this.population = population;
	}
	public Double getMonthRent() {
		return monthRent;
	}
	public void setMonthRent(Double monthRent) {
		this.monthRent = monthRent;
	}
	public Double getDownPayment() {
		return downPayment;
	}
	public void setDownPayment(Double downPayment) {
		this.downPayment = downPayment;
	}
	public Double getMargin() {
		return margin;
	}
	public void setMargin(Double margin) {
		this.margin = margin;
	}
	public java.lang.String getRoomNumber() {
		return roomNumber;
	}
	public void setRoomNumber(java.lang.String roomNumber) {
		this.roomNumber = roomNumber;
	}
	public java.lang.String getComment() {
		return comment;
	}
	public void setComment(java.lang.String comment) {
		this.comment = comment;
	}
}
