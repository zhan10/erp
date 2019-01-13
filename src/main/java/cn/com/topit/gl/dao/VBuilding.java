package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VBuilding implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.String cityName;
	public java.lang.String getCityName(){
		return this.cityName;
	}
	public void setCityName(java.lang.String cityName){
		this.cityName = cityName;
	}
	private java.lang.String areaName;
	public java.lang.String getAreaName(){
		return this.areaName;
	}
	public void setAreaName(java.lang.String areaName){
		this.areaName = areaName;
	}
	private java.lang.String name;
	public java.lang.String getName(){
		return this.name;
	}
	public void setName(java.lang.String name){
		this.name = name;
	}
	private java.lang.Long areaId;
	public java.lang.Long getAreaId(){
		return this.areaId;
	}
	public void setAreaId(java.lang.Long areaId){
		this.areaId = areaId;
	}
	private java.lang.Long circleId;
	public java.lang.Long getCircleId(){
		return this.circleId;
	}
	public void setCircleId(java.lang.Long circleId){
		this.circleId = circleId;
	}
	private java.lang.String intro;
	
	public java.lang.String getIntro() {
		return intro;
	}
	public void setIntro(java.lang.String intro) {
		this.intro = intro;
	}
	private java.lang.String circleName;
	
	public java.lang.String getCircleName() {
		return circleName;
	}
	public void setCircleName(java.lang.String circleName) {
		this.circleName = circleName;
	}
	private java.lang.String traffic;
	public java.lang.String getTraffic(){
		return this.traffic;
	}
	public void setTraffic(java.lang.String traffic){
		this.traffic = traffic;
	}
	private java.lang.String pic;
	public java.lang.String getPic(){
		return this.pic;
	}
	public void setPic(java.lang.String pic){
		this.pic = pic;
	}
	private java.lang.Long cityId;
	public java.lang.Long getCityId(){
		return this.cityId;
	}
	public void setCityId(java.lang.Long cityId){
		this.cityId = cityId;
	}
	public VBuilding() {
	}
}
