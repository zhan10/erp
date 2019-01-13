package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class FloorLock implements GenericPojo,java.io.Serializable {
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
	public FloorLock() {
	}
}
