package cn.com.topit.gl.dao;
import java.util.Date;

import cn.com.topit.base.GenericPojo;
public class VInventory implements GenericPojo,java.io.Serializable {
	private Long id;
	private String materid;
	private Integer type;
	private Date updateTime;
	private Integer quantities;
	private String principal;
	private String matername;
	private String matetypeid;
	
	
	public String getMatetypeid() {
		return matetypeid;
	}


	public void setMatetypeid(String matetypeid) {
		this.matetypeid = matetypeid;
	}


	public Long getId() {
		return id;
	}


	public void setId(Long id) {
		this.id = id;
	}


	public String getMaterid() {
		return materid;
	}


	public void setMaterid(String materid) {
		this.materid = materid;
	}


	public Integer getType() {
		return type;
	}


	public void setType(Integer type) {
		this.type = type;
	}


	public Date getUpdateTime() {
		return updateTime;
	}


	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}


	public Integer getQuantities() {
		return quantities;
	}


	public void setQuantities(Integer quantities) {
		this.quantities = quantities;
	}


	public String getPrincipal() {
		return principal;
	}


	public void setPrincipal(String principal) {
		this.principal = principal;
	}


	public String getMatername() {
		return matername;
	}


	public void setMatername(String matername) {
		this.matername = matername;
	}


	public VInventory() {
		
	}
}
