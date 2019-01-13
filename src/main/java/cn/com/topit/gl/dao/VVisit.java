package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VVisit implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Integer floorId;
	public java.lang.Integer getFloorId(){
		return this.floorId;
	}
	public void setFloorId(java.lang.Integer floorId){
		this.floorId = floorId;
	}
	private java.lang.String visitType;
	public java.lang.String getVisitType(){
		return this.visitType;
	}
	public void setVisitType(java.lang.String visitType){
		this.visitType = visitType;
	}
	private java.lang.Integer visitNumber;
	public java.lang.Integer getVisitNumber(){
		return this.visitNumber;
	}
	public void setVisitNumber(java.lang.Integer visitNumber){
		this.visitNumber = visitNumber;
	}
	private java.lang.String custom;
	public java.lang.String getCustom(){
		return this.custom;
	}
	public void setCustom(java.lang.String custom){
		this.custom = custom;
	}
	private java.lang.String phone;
	public java.lang.String getPhone(){
		return this.phone;
	}
	public void setPhone(java.lang.String phone){
		this.phone = phone;
	}
	private java.util.Date ordertime;
	public java.util.Date getOrdertime(){
		return this.ordertime;
	}
	public void setOrdertime(java.util.Date ordertime){
		this.ordertime = ordertime;
	}
	private java.util.Date createtime;
	public java.util.Date getCreatetime(){
		return this.createtime;
	}
	public void setCreatetime(java.util.Date createtime){
		this.createtime = createtime;
	}
	private java.util.Date deadlinetime;
	public java.util.Date getDeadlinetime(){
		return this.deadlinetime;
	}
	public void setDeadlinetime(java.util.Date deadlinetime){
		this.deadlinetime = deadlinetime;
	}
	private java.lang.String floorName;
	public java.lang.String getFloorName(){
		return this.floorName;
	}
	public void setFloorName(java.lang.String floorName){
		this.floorName = floorName;
	}
	private java.lang.String buildingName;
	public java.lang.String getBuildingName(){
		return this.buildingName;
	}
	public void setBuildingName(java.lang.String buildingName){
		this.buildingName = buildingName;
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
	private java.lang.Long cityId;
	public java.lang.Long getCityId(){
		return this.cityId;
	}
	public void setCityId(java.lang.Long cityId){
		this.cityId = cityId;
	}
	public VVisit() {
	}
}
