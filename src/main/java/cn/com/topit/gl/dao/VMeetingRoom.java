package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VMeetingRoom implements GenericPojo,java.io.Serializable {
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
	private java.lang.Integer galleryful;
	public java.lang.Integer getGalleryful(){
		return this.galleryful;
	}
	public void setGalleryful(java.lang.Integer galleryful){
		this.galleryful = galleryful;
	}
	private Double deposit;
	
	
	public Double getDeposit() {
		return deposit;
	}
	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}
	private Double price;
	public Double getPrice(){
		return this.price;
	}
	public void setPrice(Double price){
		this.price = price;
	}
	private java.lang.String equipment;
	public java.lang.String getEquipment(){
		return this.equipment;
	}
	public void setEquipment(java.lang.String equipment){
		this.equipment = equipment;
	}
	private java.lang.String intro;
	public java.lang.String getIntro(){
		return this.intro;
	}
	public void setIntro(java.lang.String intro){
		this.intro = intro;
	}
	private java.lang.String pic;
	public java.lang.String getPic(){
		return this.pic;
	}
	public void setPic(java.lang.String pic){
		this.pic = pic;
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
	private java.lang.Long areaId;
	public java.lang.Long getAreaId(){
		return this.areaId;
	}
	public void setAreaId(java.lang.Long areaId){
		this.areaId = areaId;
	}
	private java.lang.Long cityId;
	public java.lang.Long getCityId(){
		return this.cityId;
	}
	public void setCityId(java.lang.Long cityId){
		this.cityId = cityId;
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
	public VMeetingRoom() {
	}
	private Integer unit;
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}
}
