package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Orders implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long buildingId;
	public java.lang.Long getBuildingId(){
		return this.buildingId;
	}
	public void setBuildingId(java.lang.Long buildingId){
		this.buildingId = buildingId;
	}
	private java.lang.Long bookingId;
	public java.lang.Long getBookingId(){
		return this.bookingId;
	}
	public void setBookingId(java.lang.Long bookingId){
		this.bookingId = bookingId;
	}
	private java.util.Date ordersTime;
	public java.util.Date getOrdersTime(){
		return this.ordersTime;
	}
	public void setOrdersTime(java.util.Date ordersTime){
		this.ordersTime = ordersTime;
	}
	private java.lang.Integer status;
	public java.lang.Integer getStatus(){
		return this.status;
	}
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	private java.lang.Long consumerId;
	public java.lang.Long getConsumerId(){
		return this.consumerId;
	}
	public void setConsumerId(java.lang.Long consumerId){
		this.consumerId = consumerId;
	}
	private java.math.BigDecimal total;
	public java.math.BigDecimal getTotal(){
		return this.total;
	}
	public void setTotal(java.math.BigDecimal total){
		this.total = total;
	}
	private java.lang.String address;
	public java.lang.String getAddress(){
		return this.address;
	}
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	private java.util.Date arrTime;
	public java.util.Date getArrTime(){
		return this.arrTime;
	}
	public void setArrTime(java.util.Date arrTime){
		this.arrTime = arrTime;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	
	public Orders() {
	}
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
}
