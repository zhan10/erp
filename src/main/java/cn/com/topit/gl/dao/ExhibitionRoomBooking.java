package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class ExhibitionRoomBooking implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long exhibitionRoomId;
	public java.lang.Long getExhibitionRoomId(){
		return this.exhibitionRoomId;
	}
	public void setExhibitionRoomId(java.lang.Long exhibitionRoomId){
		this.exhibitionRoomId = exhibitionRoomId;
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
	private java.lang.Double price;
	public java.lang.Double getPrice(){
		return this.price;
	}
	public void setPrice(java.lang.Double price){
		this.price = price;
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
	public ExhibitionRoomBooking() {
	}
}
