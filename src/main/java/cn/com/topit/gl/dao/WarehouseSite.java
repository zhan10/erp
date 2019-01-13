package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class WarehouseSite implements GenericPojo,java.io.Serializable {
	private Long id;
	private String serialNumber;
	private String name;
	private Long wid;
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

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Long getWid() {
		return wid;
	}

	public void setWid(Long wid) {
		this.wid = wid;
	}

	public String getRemarks() {
		return remarks;
	}

	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	public WarehouseSite() {
	}
}
