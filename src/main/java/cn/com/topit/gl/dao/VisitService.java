package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VisitService implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.String servicename;
	public java.lang.String getServicename(){
		return this.servicename;
	}
	public void setServicename(java.lang.String servicename){
		this.servicename = servicename;
	}
	private java.lang.String servicetel;
	public java.lang.String getServicetel(){
		return this.servicetel;
	}
	public void setServicetel(java.lang.String servicetel){
		this.servicetel = servicetel;
	}
	public VisitService() {
	}
}
