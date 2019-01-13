package cn.com.topit.gl.dao;

import java.util.Calendar;
import java.util.Date;

import net.sourceforge.jtds.jdbc.DateTime;
import cn.com.topit.base.GenericPojo;

public class WorkbenchBooking implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	private java.lang.Long workbenchId;

	public java.lang.Long getWorkbenchId() {
		return this.workbenchId;
	}

	public void setWorkbenchId(java.lang.Long workbenchId) {
		this.workbenchId = workbenchId;
	}

	private java.lang.Long bookingId;

	public java.lang.Long getBookingId() {
		return this.bookingId;
	}

	public void setBookingId(java.lang.Long bookingId) {
		this.bookingId = bookingId;
	}

	private java.util.Date dateFrom;

	public java.util.Date getDateFrom() {
		return this.dateFrom;
	}

	public void setDateFrom(java.util.Date dateFrom) {
		this.dateFrom = dateFrom;
	}

	private java.util.Date dateTo;

	public java.util.Date getDateTo() {
		return this.dateTo;
	}

	public void setDateTo(java.util.Date dateTo) {
		this.dateTo = dateTo;
	}

	private Double total;

	public Double getTotal() {
		return this.total;
	}

	public void setTotal(Double total) {
		this.total = total;
	}

	private java.lang.Long consumerId;

	public java.lang.Long getConsumerId() {
		return this.consumerId;
	}

	public void setConsumerId(java.lang.Long consumerId) {
		this.consumerId = consumerId;
	}

	public WorkbenchBooking() {
	}

	private java.lang.Boolean balance;

	public java.lang.Boolean getBalance() {
		return this.balance;
	}

	public void setBalance(java.lang.Boolean balance) {
		this.balance = balance;
	}

	private Double price;

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
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
		this.balanceTime =balanceTime;
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
