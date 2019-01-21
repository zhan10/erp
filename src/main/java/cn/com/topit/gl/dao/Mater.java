package cn.com.topit.gl.dao;
import java.util.Date;

import cn.com.topit.base.GenericPojo;
public class Mater implements GenericPojo,java.io.Serializable {
	private Long id;
	private String materid;
	private String matetypeid;
	private String matername;
	private String stand;
	private String unit;
	private Long ckid;
	private Long warelocaid;
	private String description;
	private Date lastmoddate;
	private String lastmodmaker;
	private double mwidth;
	private double mdeepth;
	private double mheighth;
	private float highct;
	private float lowct;
	private float safect;
	private float atct;
	
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



	public String getMatetypeid() {
		return matetypeid;
	}



	public void setMatetypeid(String matetypeid) {
		this.matetypeid = matetypeid;
	}



	public String getMatername() {
		return matername;
	}



	public void setMatername(String matername) {
		this.matername = matername;
	}



	public String getStand() {
		return stand;
	}



	public void setStand(String stand) {
		this.stand = stand;
	}



	public String getUnit() {
		return unit;
	}



	public void setUnit(String unit) {
		this.unit = unit;
	}



	



	public Long getCkid() {
		return ckid;
	}


	public void setCkid(Long ckid) {
		this.ckid = ckid;
	}


	public Long getWarelocaid() {
		return warelocaid;
	}


	public void setWarelocaid(Long warelocaid) {
		this.warelocaid = warelocaid;
	}


	public String getDescription() {
		return description;
	}



	public void setDescription(String description) {
		this.description = description;
	}



	public Date getLastmoddate() {
		return lastmoddate;
	}



	public void setLastmoddate(Date lastmoddate) {
		this.lastmoddate = lastmoddate;
	}



	public String getLastmodmaker() {
		return lastmodmaker;
	}



	public void setLastmodmaker(String lastmodmaker) {
		this.lastmodmaker = lastmodmaker;
	}



	public double getMwidth() {
		return mwidth;
	}



	public void setMwidth(double mwidth) {
		this.mwidth = mwidth;
	}



	public double getMdeepth() {
		return mdeepth;
	}



	public void setMdeepth(double mdeepth) {
		this.mdeepth = mdeepth;
	}



	public double getMheighth() {
		return mheighth;
	}



	public void setMheighth(double mheighth) {
		this.mheighth = mheighth;
	}



	public float getHighct() {
		return highct;
	}


	public void setHighct(float highct) {
		this.highct = highct;
	}


	public float getLowct() {
		return lowct;
	}


	public void setLowct(float lowct) {
		this.lowct = lowct;
	}


	public float getSafect() {
		return safect;
	}


	public void setSafect(float safect) {
		this.safect = safect;
	}


	public float getAtct() {
		return atct;
	}


	public void setAtct(float atct) {
		this.atct = atct;
	}


	public Mater() {
		
	}
}
