package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class RoomFacilities implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		this.id = id;
	}
	
	private java.lang.String facilities;
	public java.lang.String getFacilities() {
		return facilities;
	}
	public void setFacilities(java.lang.String facilities) {
		this.facilities = facilities;
	}
	
	private java.lang.String intro;
	public java.lang.String getIntro() {
		return intro;
	}
	public void setIntro(java.lang.String intro) {
		this.intro = intro;
	}
	private java.lang.String pic;
	public java.lang.String getPic() {
		return pic;
	}
	public void setPic(java.lang.String pic) {
		this.pic = pic;
	}
	
	
}
