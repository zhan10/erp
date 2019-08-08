package cn.com.topit.gl.dao;
import java.util.Date;

import cn.com.topit.base.GenericPojo;
public class ErpCabinets implements GenericPojo,java.io.Serializable {
	private Long id;
	private String numbering;
	private String name;
	//长
	private Double width;
	//宽
	private Double height;
	//高
	private Double deepth;
	private Long number;
	private String color;
	private Double acreage;
	private String require;
	private String explain;
	private String doorDirection;
	private String doorForm;
	private Long typeId;
	private Long ordersId;
	
	
	public Long getOrdersId() {
		return ordersId;
	}


	public void setOrdersId(Long ordersId) {
		this.ordersId = ordersId;
	}


	public Long getTypeId() {
		return typeId;
	}


	public void setTypeId(Long typeId) {
		this.typeId = typeId;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getNumbering() {
		return numbering;
	}


	public void setNumbering(String numbering) {
		this.numbering = numbering;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public Double getWidth() {
		return width;
	}


	public void setWidth(Double width) {
		this.width = width;
	}


	public Double getHeight() {
		return height;
	}


	public void setHeight(Double height) {
		this.height = height;
	}


	public Double getDeepth() {
		return deepth;
	}


	public void setDeepth(Double deepth) {
		this.deepth = deepth;
	}


	public Long getNumber() {
		return number;
	}


	public void setNumber(Long number) {
		this.number = number;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public Double getAcreage() {
		return acreage;
	}


	public void setAcreage(Double acreage) {
		this.acreage = acreage;
	}


	public String getRequire() {
		return require;
	}


	public void setRequire(String require) {
		this.require = require;
	}


	public String getExplain() {
		return explain;
	}


	public void setExplain(String explain) {
		this.explain = explain;
	}


	


	public String getDoorDirection() {
		return doorDirection;
	}


	public void setDoorDirection(String doorDirection) {
		this.doorDirection = doorDirection;
	}


	public String getDoorForm() {
		return doorForm;
	}


	public void setDoorForm(String doorForm) {
		this.doorForm = doorForm;
	}


	public ErpCabinets() {
		
	}
}
