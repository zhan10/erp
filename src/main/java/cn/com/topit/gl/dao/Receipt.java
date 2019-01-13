package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class Receipt implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;
	private Date timeEntry;
	private java.lang.String accountNumber;
	private java.lang.String outTradeNo;
	private java.lang.String tradeNo;
	private java.lang.String city;
	private java.lang.String serviceItems;
	private java.lang.String productName;
	private java.lang.String price;
	private java.lang.Integer amount;
	private java.lang.String receiptAmount;
	private java.lang.String accountBalance;
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		this.id = id;
	}
	public Date getTimeEntry() {
		return timeEntry;
	}
	public void setTimeEntry(Date timeEntry) {
		this.timeEntry = timeEntry;
	}
	public java.lang.String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(java.lang.String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public java.lang.String getOutTradeNo() {
		return outTradeNo;
	}
	public void setOutTradeNo(java.lang.String outTradeNo) {
		this.outTradeNo = outTradeNo;
	}
	public java.lang.String getTradeNo() {
		return tradeNo;
	}
	public void setTradeNo(java.lang.String tradeNo) {
		this.tradeNo = tradeNo;
	}
	public java.lang.String getCity() {
		return city;
	}
	public void setCity(java.lang.String city) {
		this.city = city;
	}
	public java.lang.String getServiceItems() {
		return serviceItems;
	}
	public void setServiceItems(java.lang.String serviceItems) {
		this.serviceItems = serviceItems;
	}
	public java.lang.String getProductName() {
		return productName;
	}
	public void setProductName(java.lang.String productName) {
		this.productName = productName;
	}
	public java.lang.String getPrice() {
		return price;
	}
	public void setPrice(java.lang.String price) {
		this.price = price;
	}
	public java.lang.Integer getAmount() {
		return amount;
	}
	public void setAmount(java.lang.Integer amount) {
		this.amount = amount;
	}
	public java.lang.String getReceiptAmount() {
		return receiptAmount;
	}
	public void setReceiptAmount(java.lang.String receiptAmount) {
		this.receiptAmount = receiptAmount;
	}
	public java.lang.String getAccountBalance() {
		return accountBalance;
	}
	public void setAccountBalance(java.lang.String accountBalance) {
		this.accountBalance = accountBalance;
	}	
	
}
