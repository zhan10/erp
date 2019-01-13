package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class VPrintRecord implements GenericPojo, java.io.Serializable {
	private Long id;
	private Date printTime;
	private Long consumerId;
	private String consumerName;
	private String printerModel;
	private String printerMac;
	private String printerIp;
	private String printFormat;
	private String paperFormat;
	private Integer paperCount;
	private Date syncTime;
	private Short chargeUnit;
	private Double price;
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
	
	public Long getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(Long consumerId) {
		this.consumerId = consumerId;
	}
	public String getConsumerName() {
		return consumerName;
	}
	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
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
	public String getPrintFormat() {
		return printFormat;
	}
	public void setPrintFormat(String printFormat) {
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
	public Short getChargeUnit() {
		return chargeUnit;
	}
	public void setChargeUnit(Short chargeUnit) {
		this.chargeUnit = chargeUnit;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public String getCardNumber() {
		return cardNumber;
	}
	public void setCardNumber(String cardNumber) {
		this.cardNumber = cardNumber;
	}
	
}
