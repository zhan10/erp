package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class MemberLevel implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		this.id = id;
	}
	
	private java.lang.String name;
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}

	private java.lang.String intro;
	public java.lang.String getIntro() {
		return intro;
	}
	public void setIntro(java.lang.String intro) {
		this.intro = intro;
	}
}
