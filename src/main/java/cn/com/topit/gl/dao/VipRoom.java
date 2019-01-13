package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VipRoom implements GenericPojo,java.io.Serializable {
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
	private java.lang.Double price;
	public java.lang.Double getPrice(){
		return this.price;
	}
	public void setPrice(java.lang.Double price){
		this.price = price;
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
	private java.lang.Integer galleryful;
	public java.lang.Integer getGalleryful(){
		return this.galleryful;
	}
	public void setGalleryful(java.lang.Integer galleryful){
		this.galleryful = galleryful;
	}
	private java.lang.Long floorId;
	public java.lang.Long getFloorId(){
		return this.floorId;
	}
	public void setFloorId(java.lang.Long floorId){
		this.floorId = floorId;
	}
	private java.lang.String equipment;
	public java.lang.String getEquipment(){
		return this.equipment;
	}
	public void setEquipment(java.lang.String equipment){
		this.equipment = equipment;
	}
	public VipRoom() {
	}
	private Integer unit;
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}
}
