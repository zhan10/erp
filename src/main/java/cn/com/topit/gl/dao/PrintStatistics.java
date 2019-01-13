package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class PrintStatistics implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;
	private Date printTime;
	private Long printUser;
	private java.lang.String printFormat;
	private java.lang.String paperFormat;
	private Long printCount;
	private Double price;
	private Double priceTotal;
	private java.lang.String cardNumber;
	
	public java.lang.Long getId() {
		return id;
	}


	public void setId(java.lang.Long id) {
		this.id = id;
	}


	public Date getPrintTime() {
		return printTime;
	}


	public void setPrintTime(Date printTime) {
		this.printTime = printTime;
	}


	public Long getPrintUser() {
		return printUser;
	}


	public void setPrintUser(Long printUser) {
		this.printUser = printUser;
	}





	public java.lang.String getPrintFormat() {
		return printFormat;
	}


	public void setPrintFormat(java.lang.String printFormat) {
		this.printFormat = printFormat;
	}


	public java.lang.String getPaperFormat() {
		return paperFormat;
	}


	public void setPaperFormat(java.lang.String paperFormat) {
		this.paperFormat = paperFormat;
	}


	public Long getPrintCount() {
		return printCount;
	}


	public void setPrintCount(Long printCount) {
		this.printCount = printCount;
	}


	public Double getPrice() {
		return price;
	}


	public void setPrice(Double price) {
		this.price = price;
	}


	public Double getPriceTotal() {
		return priceTotal;
	}


	public void setPriceTotal(Double priceTotal) {
		this.priceTotal = priceTotal;
	}


	public java.lang.String getCardNumber() {
		return cardNumber;
	}


	public void setCardNumber(java.lang.String cardNumber) {
		this.cardNumber = cardNumber;
	}


	public PrintStatistics() {
	}
}
