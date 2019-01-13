package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Warehouse implements GenericPojo,java.io.Serializable {
	private Long id;
	private String serialNumber;
	private Integer type;
	private String name;
	private String remarks;
	
	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getSerialNumber() {
		return serialNumber;
	}


	public void setSerialNumber(String serialNumber) {
		this.serialNumber = serialNumber;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public String getRemarks() {
		return remarks;
	}


	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}


	public Warehouse() {
	}
}
