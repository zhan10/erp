package cn.com.topit.gl.dao;
import java.util.Date;

import cn.com.topit.base.GenericPojo;
public class VBookingOffice implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Boolean balance;
	public java.lang.Boolean getBalance(){
		return this.balance;
	}
	public void setBalance(java.lang.Boolean balance){
		this.balance = balance;
	}
	private java.lang.String code;
	public java.lang.String getCode(){
		return this.code;
	}
	public void setCode(java.lang.String code){
		this.code = code;
	}
	private java.lang.String officeName;
	
	private java.lang.String consumerName;
	public java.lang.String getConsumerName(){
		return this.consumerName;
	}
	public void setConsumerName(java.lang.String consumerName){
		this.consumerName = consumerName;
	}
	private java.lang.String cityName;
	public java.lang.String getCityName(){
		return this.cityName;
	}
	public void setCityName(java.lang.String cityName){
		this.cityName = cityName;
	}
	private java.lang.String areaName;
	public java.lang.String getAreaName(){
		return this.areaName;
	}
	public void setAreaName(java.lang.String areaName){
		this.areaName = areaName;
	}
	private java.lang.String buildingName;
	public java.lang.String getBuildingName(){
		return this.buildingName;
	}
	public void setBuildingName(java.lang.String buildingName){
		this.buildingName = buildingName;
	}
	private java.lang.String floorName;
	public java.lang.String getFloorName(){
		return this.floorName;
	}
	public void setFloorName(java.lang.String floorName){
		this.floorName = floorName;
	}
	private java.lang.String officeType;
	public java.lang.String getOfficeType(){
		return this.officeType;
	}
	public void setOfficeType(java.lang.String officeType){
		this.officeType = officeType;
	}
	private java.lang.Integer persons;
	public java.lang.Integer getPersons(){
		return this.persons;
	}
	public void setPersons(java.lang.Integer persons){
		this.persons = persons;
	}
	private java.util.Date dateFrom;
	public java.util.Date getDateFrom(){
		return this.dateFrom;
	}
	public void setDateFrom(java.util.Date dateFrom){
		this.dateFrom = dateFrom;
	}
	private java.util.Date dateTo;
	public java.util.Date getDateTo(){
		return this.dateTo;
	}
	public void setDateTo(java.util.Date dateTo){
		this.dateTo = dateTo;
	}
	private java.lang.Double total;
	public java.lang.Double getTotal(){
		return this.total;
	}
	public void setTotal(java.lang.Double total){
		this.total = total;
	}
	private java.lang.Double price;
	public java.lang.Double getPrice(){
		return this.price;
	}
	public void setPrice(java.lang.Double price){
		this.price = price;
	}
	private java.lang.Long officeId;
	public java.lang.Long getOfficeId(){
		return this.officeId;
	}
	public void setOfficeId(java.lang.Long officeId){
		this.officeId = officeId;
	}
	private java.lang.Long bookingId;
	public java.lang.Long getBookingId(){
		return this.bookingId;
	}
	public void setBookingId(java.lang.Long bookingId){
		this.bookingId = bookingId;
	}
	private java.lang.Long consumerId;
	public java.lang.Long getConsumerId(){
		return this.consumerId;
	}
	public void setConsumerId(java.lang.Long consumerId){
		this.consumerId = consumerId;
	}
	private java.lang.Long typeId;
	public java.lang.Long getTypeId(){
		return this.typeId;
	}
	public void setTypeId(java.lang.Long typeId){
		this.typeId = typeId;
	}
	private java.lang.Long floorId;
	public java.lang.Long getFloorId(){
		return this.floorId;
	}
	public void setFloorId(java.lang.Long floorId){
		this.floorId = floorId;
	}
	private java.lang.Long buildingId;
	public java.lang.Long getBuildingId(){
		return this.buildingId;
	}
	public void setBuildingId(java.lang.Long buildingId){
		this.buildingId = buildingId;
	}
	private java.lang.Long areaId;
	public java.lang.Long getAreaId(){
		return this.areaId;
	}
	public void setAreaId(java.lang.Long areaId){
		this.areaId = areaId;
	}
	private java.lang.Long cityId;
	public java.lang.Long getCityId(){
		return this.cityId;
	}
	public void setCityId(java.lang.Long cityId){
		this.cityId = cityId;
	}
	public VBookingOffice() {
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
	public java.lang.String getOfficeName() {
		return officeName;
	}
	public void setOfficeName(java.lang.String officeName) {
		this.officeName = officeName;
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
}
