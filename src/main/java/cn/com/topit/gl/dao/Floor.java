package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Floor implements GenericPojo,java.io.Serializable {
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
	private java.lang.String intro;
	public java.lang.String getIntro(){
		return this.intro;
	}
	public void setIntro(java.lang.String intro){
		this.intro = intro;
	}
	private java.lang.Long buildingId;
	public java.lang.Long getBuildingId(){
		return this.buildingId;
	}
	public void setBuildingId(java.lang.Long buildingId){
		this.buildingId = buildingId;
	}
	private java.lang.String pic;
	public java.lang.String getPic(){
		return this.pic;
	}
	public void setPic(java.lang.String pic){
		this.pic = pic;
	}
	public Floor() {
	}
}
