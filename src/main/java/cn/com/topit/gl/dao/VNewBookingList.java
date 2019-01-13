package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VNewBookingList implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Integer status;
	public java.lang.Integer getStatus(){
		return this.status;
	}
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	private java.lang.String code;
	public java.lang.String getCode(){
		return this.code;
	}
	public void setCode(java.lang.String code){
		this.code = code;
	}
	private java.lang.String productName;
	public java.lang.String getProductName(){
		return this.productName;
	}
	public void setProductName(java.lang.String productName){
		this.productName = productName;
	}
	private java.lang.String buildingName;
	public java.lang.String getBuildingName(){
		return this.buildingName;
	}
	public void setBuildingName(java.lang.String buildingName){
		this.buildingName = buildingName;
	}
	private java.lang.String consumerName;
	public java.lang.String getConsumerName(){
		return this.consumerName;
	}
	public void setConsumerName(java.lang.String consumerName){
		this.consumerName = consumerName;
	}
	private java.math.BigDecimal deposit;
	public java.math.BigDecimal getDeposit(){
		return this.deposit;
	}
	public void setDeposit(java.math.BigDecimal deposit){
		this.deposit = deposit;
	}
	private java.lang.Integer quantity;
	public java.lang.Integer getQuantity(){
		return this.quantity;
	}
	public void setQuantity(java.lang.Integer quantity){
		this.quantity = quantity;
	}
	private java.math.BigDecimal price;
	public java.math.BigDecimal getPrice(){
		return this.price;
	}
	public void setPrice(java.math.BigDecimal price){
		this.price = price;
	}
	private java.math.BigDecimal total;
	public java.math.BigDecimal getTotal(){
		return this.total;
	}
	public void setTotal(java.math.BigDecimal total){
		this.total = total;
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
	private java.util.Date bookingTime;
	public java.util.Date getBookingTime(){
		return this.bookingTime;
	}
	public void setBookingTime(java.util.Date bookingTime){
		this.bookingTime = bookingTime;
	}
	private java.lang.String tel;
	public java.lang.String getTel(){
		return this.tel;
	}
	public void setTel(java.lang.String tel){
		this.tel = tel;
	}
	private java.lang.String email;
	public java.lang.String getEmail(){
		return this.email;
	}
	public void setEmail(java.lang.String email){
		this.email = email;
	}
	private java.lang.Integer productType;
	public java.lang.Integer getProductType(){
		return this.productType;
	}
	public void setProductType(java.lang.Integer productType){
		this.productType = productType;
	}
	private java.lang.Long productId;
	public java.lang.Long getProductId(){
		return this.productId;
	}
	public void setProductId(java.lang.Long productId){
		this.productId = productId;
	}
	private java.lang.Long consumerId;
	public java.lang.Long getConsumerId(){
		return this.consumerId;
	}
	public void setConsumerId(java.lang.Long consumerId){
		this.consumerId = consumerId;
	}
	private java.lang.String cityName;
	public java.lang.String getCityName(){
		return this.cityName;
	}
	public void setCityName(java.lang.String cityName){
		this.cityName = cityName;
	}
	private java.lang.String floorName;
	public java.lang.String getFloorName(){
		return this.floorName;
	}
	public void setFloorName(java.lang.String floorName){
		this.floorName = floorName;
	}
	private java.lang.String serviceName;
	private java.lang.String serviceTel;
	
	public java.lang.String getServiceName() {
		return serviceName;
	}
	public void setServiceName(java.lang.String serviceName) {
		this.serviceName = serviceName;
	}
	public java.lang.String getServiceTel() {
		return serviceTel;
	}
	public void setServiceTel(java.lang.String serviceTel) {
		this.serviceTel = serviceTel;
	}
	public VNewBookingList() {
	}
}
