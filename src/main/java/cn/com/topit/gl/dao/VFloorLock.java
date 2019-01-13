package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VFloorLock implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long floorId;
	public java.lang.Long getFloorId(){
		return this.floorId;
	}
	public void setFloorId(java.lang.Long floorId){
		this.floorId = floorId;
	}
	private java.util.Date lockFrom;
	public java.util.Date getLockFrom(){
		return this.lockFrom;
	}
	public void setLockFrom(java.util.Date lockFrom){
		this.lockFrom = lockFrom;
	}
	private java.util.Date lockTo;
	public java.util.Date getLockTo(){
		return this.lockTo;
	}
	public void setLockTo(java.util.Date lockTo){
		this.lockTo = lockTo;
	}
	private java.util.Date createTime;
	public java.util.Date getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
	}
	private java.lang.Long cityId;
	public java.lang.Long getCityId(){
		return this.cityId;
	}
	public void setCityId(java.lang.Long cityId){
		this.cityId = cityId;
	}
	private java.lang.String cityName;
	public java.lang.String getCityName(){
		return this.cityName;
	}
	public void setCityName(java.lang.String cityName){
		this.cityName = cityName;
	}
	private java.lang.Long buildingId;
	public java.lang.Long getBuildingId(){
		return this.buildingId;
	}
	public void setBuildingId(java.lang.Long buildingId){
		this.buildingId = buildingId;
	}
	private java.lang.String buildingName;
	public java.lang.String getBuildingName(){
		return this.buildingName;
	}
	public void setBuildingName(java.lang.String buildingName){
		this.buildingName = buildingName;
	}
	private java.lang.String floorName;
	public java.lang.String getFloorName(){
		return this.floorName;
	}
	public void setFloorName(java.lang.String floorName){
		this.floorName = floorName;
	}
	public VFloorLock() {
	}
}
