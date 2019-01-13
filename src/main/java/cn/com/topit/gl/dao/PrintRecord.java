package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class PrintRecord implements GenericPojo, java.io.Serializable {
	private Long id;
	private Date printTime;
	private Long comsumerId;
	private String printerModel;
	private String printerMac;
	private String printerIp;
	private Short printFormat;
	private String paperFormat;
	private Integer paperCount;
	private Date syncTime;
	private String cardNumber;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Date getPrintTime() {
		return printTime;
	}
	public void setPrintTime(Date printTime) {
		this.printTime = printTime;
	}
	
	public Long getComsumerId() {
		return comsumerId;
	}
	public void setComsumerId(Long comsumerId) {
		this.comsumerId = comsumerId;
	}
	public String getPrinterModel() {
		return printerModel;
	}
	public void setPrinterModel(String printerModel) {
		this.printerModel = printerModel;
	}
	public String getPrinterMac() {
		return printerMac;
	}
	public void setPrinterMac(String printerMac) {
		this.printerMac = printerMac;
	}
	public String getPrinterIp() {
		return printerIp;
	}
	public void setPrinterIp(String printerIp) {
		this.printerIp = printerIp;
	}
	public Short getPrintFormat() {
		return printFormat;
	}
	public void setPrintFormat(Short printFormat) {
		this.printFormat = printFormat;
	}
	public String getPaperFormat() {
		return paperFormat;
	}
	public void setPaperFormat(String paperFormat) {
		this.paperFormat = paperFormat;
	}
	public Integer getPaperCount() {
		return paperCount;
	}
	public void setPaperCount(Integer paperCount) {
		this.paperCount = paperCount;
	}
	public Date getSyncTime() {
		return syncTime;
	}
	public void setSyncTime(Date syncTime) {
		this.syncTime = syncTime;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	
}
