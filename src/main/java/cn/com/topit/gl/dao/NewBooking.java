package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class NewBooking implements GenericPojo,java.io.Serializable {
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
	private java.util.Date bookingTime;
	public java.util.Date getBookingTime(){
		return this.bookingTime;
	}
	public void setBookingTime(java.util.Date bookingTime){
		this.bookingTime = bookingTime;
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
	private java.lang.Integer quantity;
	public java.lang.Integer getQuantity(){
		return this.quantity;
	}
	public void setQuantity(java.lang.Integer quantity){
		this.quantity = quantity;
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
	private java.math.BigDecimal price;
	public java.math.BigDecimal getPrice(){
		return this.price;
	}
	public void setPrice(java.math.BigDecimal price){
		this.price = price;
	}
	private java.math.BigDecimal deposit;
	public java.math.BigDecimal getDeposit(){
		return this.deposit;
	}
	public void setDeposit(java.math.BigDecimal deposit){
		this.deposit = deposit;
	}
	public NewBooking() {
	}
}
