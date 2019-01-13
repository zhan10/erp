package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VOfficeLock implements GenericPojo,java.io.Serializable {
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
	private java.lang.String productName;
	public java.lang.String getProductName(){
		return this.productName;
	}
	public void setProductName(java.lang.String productName){
		this.productName = productName;
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
	private java.lang.Long productId;
	public java.lang.Long getProductId(){
		return this.productId;
	}
	public void setProductId(java.lang.Long productId){
		this.productId = productId;
	}
	public VOfficeLock() {
	}
}
