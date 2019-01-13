package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class CultivateRoomBooking implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	private java.lang.Long cultivateRoomId;
	private java.lang.Long bookingId;
	private java.util.Date dateFrom;
	private java.util.Date dateTo;
	private java.lang.Double price;
	private java.lang.Double total;
	private java.lang.Long consumerId;
	private java.lang.Boolean balance;
	private java.util.Date balanceTime;
	private java.lang.Double balancePrice;
	private java.lang.Integer state;
	private java.lang.Long badge;
	
	public java.lang.Long getId() {
		return id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	public java.lang.Long getCultivateRoomId() {
		return cultivateRoomId;
	}

	public void setCultivateRoomId(java.lang.Long cultivateRoomId) {
		this.cultivateRoomId = cultivateRoomId;
	}

	public java.lang.Long getBookingId() {
		return bookingId;
	}

	public void setBookingId(java.lang.Long bookingId) {
		this.bookingId = bookingId;
	}

	public java.util.Date getDateFrom() {
		return dateFrom;
	}

	public void setDateFrom(java.util.Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	public java.util.Date getDateTo() {
		return dateTo;
	}

	public void setDateTo(java.util.Date dateTo) {
		this.dateTo = dateTo;
	}

	public java.lang.Double getPrice() {
		return price;
	}

	public void setPrice(java.lang.Double price) {
		this.price = price;
	}

	public java.lang.Double getTotal() {
		return total;
	}

	public void setTotal(java.lang.Double total) {
		this.total = total;
	}

	public java.lang.Long getConsumerId() {
		return consumerId;
	}

	public void setConsumerId(java.lang.Long consumerId) {
		this.consumerId = consumerId;
	}

	public java.lang.Boolean getBalance() {
		return balance;
	}

	public void setBalance(java.lang.Boolean balance) {
		this.balance = balance;
	}

	public java.util.Date getBalanceTime() {
		return balanceTime;
	}

	public void setBalanceTime(java.util.Date balanceTime) {
		this.balanceTime = balanceTime;
	}

	public java.lang.Double getBalancePrice() {
		return balancePrice;
	}

	public void setBalancePrice(java.lang.Double balancePrice) {
		this.balancePrice = balancePrice;
	}

	public java.lang.Integer getState() {
		return state;
	}

	public void setState(java.lang.Integer state) {
		this.state = state;
	}

	public java.lang.Long getBadge() {
		return badge;
	}

	public void setBadge(java.lang.Long badge) {
		this.badge = badge;
	}

	public CultivateRoomBooking() {
	}
}
