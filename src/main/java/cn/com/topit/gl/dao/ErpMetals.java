package cn.com.topit.gl.dao;
import java.util.Date;

import cn.com.topit.base.GenericPojo;
public class ErpMetals implements GenericPojo,java.io.Serializable {
	private Long id;
	private String name;
	private String model;
	private Double number;
	private String unit;
	private String materCode;
	private String remark;
	private Long ordersId;

	
	public Long getOrdersId() {
		return ordersId;
	}


	public void setOrdersId(Long ordersId) {
		this.ordersId = ordersId;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getModel() {
		return model;
	}


	public void setModel(String model) {
		this.model = model;
	}


	public Double getNumber() {
		return number;
	}


	public void setNumber(Double number) {
		this.number = number;
	}


	public String getUnit() {
		return unit;
	}


	public void setUnit(String unit) {
		this.unit = unit;
	}


	public String getMaterCode() {
		return materCode;
	}


	public void setMaterCode(String materCode) {
		this.materCode = materCode;
	}


	public String getRemark() {
		return remark;
	}


	public void setRemark(String remark) {
		this.remark = remark;
	}


	public ErpMetals() {
		
	}
}
