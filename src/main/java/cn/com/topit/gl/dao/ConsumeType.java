package cn.com.topit.gl.dao;

import java.math.BigDecimal;

import cn.com.topit.base.GenericPojo;

public class ConsumeType implements GenericPojo, java.io.Serializable {
	private Long id;
	private String code;
	private String name;
	private Short chargeType;
	private String chargeUnit;
	private BigDecimal price;
	
	public ConsumeType() {
		
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Short getChargeType() {
		return chargeType;
	}
	public void setChargeType(Short chargeType) {
		this.chargeType = chargeType;
	}
	public String getChargeUnit() {
		return chargeUnit;
	}
	public void setChargeUnit(String chargeUnit) {
		this.chargeUnit = chargeUnit;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	
	
}