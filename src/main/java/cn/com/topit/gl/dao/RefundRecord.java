package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class RefundRecord implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long consumerId;
	public java.lang.Long getConsumerId(){
		return this.consumerId;
	}
	public void setConsumerId(java.lang.Long consumerId){
		this.consumerId = consumerId;
	}
	private java.util.Date refundTime;
	public java.util.Date getRefundTime(){
		return this.refundTime;
	}
	public void setRefundTime(java.util.Date refundTime){
		this.refundTime = refundTime;
	}
	private java.math.BigDecimal amount;
	public java.math.BigDecimal getAmount(){
		return this.amount;
	}
	public void setAmount(java.math.BigDecimal amount){
		this.amount = amount;
	}
	private java.lang.Long bookingId;
	public java.lang.Long getBookingId(){
		return this.bookingId;
	}
	public void setBookingId(java.lang.Long bookingId){
		this.bookingId = bookingId;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	private java.lang.Long relatedId;
	public java.lang.Long getRelatedId(){
		return this.relatedId;
	}
	public void setRelatedId(java.lang.Long relatedId){
		this.relatedId = relatedId;
	}
	private java.lang.Integer relatedType;
	public java.lang.Integer getRelatedType(){
		return this.relatedType;
	}
	public void setRelatedType(java.lang.Integer relatedType){
		this.relatedType = relatedType;
	}
	public RefundRecord() {
	}
}
