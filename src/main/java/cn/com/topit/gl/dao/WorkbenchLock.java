package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class WorkbenchLock implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long productId;
	public java.lang.Long getProductId(){
		return this.productId;
	}
	public void setProductId(java.lang.Long productId){
		this.productId = productId;
	}
	private java.lang.Long quantity;
	public java.lang.Long getQuantity(){
		return this.quantity;
	}
	public void setQuantity(java.lang.Long quantity){
		this.quantity = quantity;
	}
	private java.util.Date createTime;
	public java.util.Date getCreateTime(){
		return this.createTime;
	}
	public void setCreateTime(java.util.Date createTime){
		this.createTime = createTime;
	}
	private java.util.Date lockFrom;
	public java.util.Date getLockFrom(){
		return this.lockFrom;
	}
	public void setLockFrom(java.util.Date lockFrom){
		this.lockFrom = lockFrom;
	}
	private java.util.Date lockTo;
	public java.util.Date getLockTo() {
		return lockTo;
	}
	public void setLockTo(java.util.Date lockTo) {
		this.lockTo = lockTo;
	}
	public WorkbenchLock() {
	}
}
