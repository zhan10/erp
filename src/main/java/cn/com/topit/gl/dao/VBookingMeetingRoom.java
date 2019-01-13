package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VBookingMeetingRoom implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long meetingRoomId;
	public java.lang.Long getMeetingRoomId(){
		return this.meetingRoomId;
	}
	public void setMeetingRoomId(java.lang.Long meetingRoomId){
		this.meetingRoomId = meetingRoomId;
	}
	private java.lang.Long bookingId;
	public java.lang.Long getBookingId(){
		return this.bookingId;
	}
	public void setBookingId(java.lang.Long bookingId){
		this.bookingId = bookingId;
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
	private java.lang.Long consumerId;
	public java.lang.Long getConsumerId(){
		return this.consumerId;
	}
	public void setConsumerId(java.lang.Long consumerId){
		this.consumerId = consumerId;
	}
	private java.lang.String consumerName;
	public java.lang.String getConsumerName(){
		return this.consumerName;
	}
	public void setConsumerName(java.lang.String consumerName){
		this.consumerName = consumerName;
	}
	private java.lang.String code;
	public java.lang.String getCode(){
		return this.code;
	}
	public void setCode(java.lang.String code){
		this.code = code;
	}
	private java.lang.Double price;
	public java.lang.Double getPrice(){
		return this.price;
	}
	public void setPrice(java.lang.Double price){
		this.price = price;
	}
	private java.lang.Boolean balance;
	public java.lang.Boolean getBalance(){
		return this.balance;
	}
	public void setBalance(java.lang.Boolean balance){
		this.balance = balance;
	}
	private java.util.Date balanceTime;
	public java.util.Date getBalanceTime(){
		return this.balanceTime;
	}
	public void setBalanceTime(java.util.Date balanceTime){
		this.balanceTime = balanceTime;
	}
	private java.lang.Double balancePrice;
	public java.lang.Double getBalancePrice(){
		return this.balancePrice;
	}
	public void setBalancePrice(java.lang.Double balancePrice){
		this.balancePrice = balancePrice;
	}
	private java.lang.String meetingRoomName;
	public java.lang.String getMeetingRoomName(){
		return this.meetingRoomName;
	}
	public void setMeetingRoomName(java.lang.String meetingRoomName){
		this.meetingRoomName = meetingRoomName;
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
	private java.lang.Double consumerFund;
	public java.lang.Double getConsumerFund(){
		return this.consumerFund;
	}
	public void setConsumerFund(java.lang.Double consumerFund){
		this.consumerFund = consumerFund;
	}
	private String meetingInfo;
	
	public VBookingMeetingRoom() {
	}
	public String getMeetingInfo() {
		return meetingInfo;
	}
	public void setMeetingInfo(String meetingInfo) {
		this.meetingInfo = meetingInfo;
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
