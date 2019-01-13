package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VNewOffice implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
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
	private java.lang.String name;
	public java.lang.String getName(){
		return this.name;
	}
	public void setName(java.lang.String name){
		this.name = name;
	}
	private java.lang.String numbering;
	public java.lang.String getNumbering(){
		return this.numbering;
	}
	public void setNumbering(java.lang.String numbering){
		this.numbering = numbering;
	}
	private java.lang.Integer workbenchNumber;
	public java.lang.Integer getWorkbenchNumber(){
		return this.workbenchNumber;
	}
	public void setWorkbenchNumber(java.lang.Integer workbenchNumber){
		this.workbenchNumber = workbenchNumber;
	}
	private java.math.BigDecimal price;
	public java.math.BigDecimal getPrice(){
		return this.price;
	}
	public void setPrice(java.math.BigDecimal price){
		this.price = price;
	}
	private java.lang.Integer deposit;
	public java.lang.Integer getDeposit(){
		return this.deposit;
	}
	public void setDeposit(java.lang.Integer deposit){
		this.deposit = deposit;
	}
	private java.lang.Integer payRatio;
	public java.lang.Integer getPayRatio(){
		return this.payRatio;
	}
	public void setPayRatio(java.lang.Integer payRatio){
		this.payRatio = payRatio;
	}
	private java.lang.String planePic;
	public java.lang.String getPlanePic(){
		return this.planePic;
	}
	public void setPlanePic(java.lang.String planePic){
		this.planePic = planePic;
	}
	private java.lang.String coverPic;
	public java.lang.String getCoverPic(){
		return this.coverPic;
	}
	public void setCoverPic(java.lang.String coverPic){
		this.coverPic = coverPic;
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
	private java.lang.Long floorId;
	public java.lang.Long getFloorId(){
		return this.floorId;
	}
	public void setFloorId(java.lang.Long floorId){
		this.floorId = floorId;
	}
	public VNewOffice() {
	}
}
