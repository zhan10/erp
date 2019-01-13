package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Workbench implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long typeId;
	public java.lang.Long getTypeId(){
		return this.typeId;
	}
	public void setTypeId(java.lang.Long typeId){
		this.typeId = typeId;
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
	private java.lang.Long floorId;
	public java.lang.Long getFloorId(){
		return this.floorId;
	}
	public void setFloorId(java.lang.Long floorId){
		this.floorId = floorId;
	}
	private java.lang.String pic;
	public java.lang.String getPic(){
		return this.pic;
	}
	public void setPic(java.lang.String pic){
		this.pic = pic;
	}
	public Workbench() {
	}
	private java.lang.String equipment;
	public java.lang.String getEquipment() {
		return equipment;
	}
	public void setEquipment(java.lang.String equipment) {
		this.equipment = equipment;
	}
	private java.lang.String bigPic;
	private java.lang.String leftPic;
	private java.lang.String midPic;
	private java.lang.String rightPic;
	private java.lang.String planePic;
	private java.lang.String area;
	private java.lang.String orientation;
	public java.lang.String getBigPic() {
		return bigPic;
	}
	public void setBigPic(java.lang.String bigPic) {
		this.bigPic = bigPic;
	}
	public java.lang.String getLeftPic() {
		return leftPic;
	}
	public void setLeftPic(java.lang.String leftPic) {
		this.leftPic = leftPic;
	}
	public java.lang.String getMidPic() {
		return midPic;
	}
	public void setMidPic(java.lang.String midPic) {
		this.midPic = midPic;
	}
	public java.lang.String getRightPic() {
		return rightPic;
	}
	public void setRightPic(java.lang.String rightPic) {
		this.rightPic = rightPic;
	}
	public java.lang.String getPlanePic() {
		return planePic;
	}
	public void setPlanePic(java.lang.String planePic) {
		this.planePic = planePic;
	}
	public java.lang.String getArea() {
		return area;
	}
	public void setArea(java.lang.String area) {
		this.area = area;
	}
	public java.lang.String getOrientation() {
		return orientation;
	}
	public void setOrientation(java.lang.String orientation) {
		this.orientation = orientation;
	}
	
	
}
