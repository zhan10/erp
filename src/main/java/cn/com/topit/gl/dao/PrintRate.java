package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class PrintRate implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;
	private java.lang.String printFormat;
	private java.lang.String paperFormat;
	private java.lang.Long chargeUnit;
	private java.lang.String chargeType;
	private Double price;
	
	public java.lang.Long getId() {
		return id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}

	
	public java.lang.Long getChargeUnit() {
		return chargeUnit;
	}

	public void setChargeUnit(java.lang.Long chargeUnit) {
		this.chargeUnit = chargeUnit;
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

	public java.lang.String getChargeType() {
		return chargeType;
	}

	public void setChargeType(java.lang.String chargeType) {
		this.chargeType = chargeType;
	}

	public Double getPrice() {
		return price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public PrintRate() {
	}
}
