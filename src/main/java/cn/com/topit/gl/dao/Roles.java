package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class Roles implements GenericPojo<Long>,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.String name;
	public java.lang.String getName(){
		return this.name;
	}
	public void setName(java.lang.String name){
		this.name = name;
	}
	private java.lang.String info;
	public java.lang.String getInfo(){
		return this.info;
	}
	public void setInfo(java.lang.String info){
		this.info = info;
	}
	public Roles() {
	}
}
