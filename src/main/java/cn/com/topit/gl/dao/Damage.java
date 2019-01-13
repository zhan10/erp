package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Damage implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
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
	private java.util.Date payTime;
	public java.util.Date getPayTime(){
		return this.payTime;
	}
	public void setPayTime(java.util.Date payTime){
		this.payTime = payTime;
	}
	private java.lang.String digest;
	public java.lang.String getDigest(){
		return this.digest;
	}
	public void setDigest(java.lang.String digest){
		this.digest = digest;
	}
	private java.lang.Double payment;
	public java.lang.Double getPayment(){
		return this.payment;
	}
	public void setPayment(java.lang.Double payment){
		this.payment = payment;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	public Damage() {
	}
}
