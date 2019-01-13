package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class TechCardOrders implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long ordersItemId;
	public java.lang.Long getOrdersItemId(){
		return this.ordersItemId;
	}
	public void setOrdersItemId(java.lang.Long ordersItemId){
		this.ordersItemId = ordersItemId;
	}
	private java.lang.Long techCardId;
	public java.lang.Long getTechCardId(){
		return this.techCardId;
	}
	public void setTechCardId(java.lang.Long techCardId){
		this.techCardId = techCardId;
	}
	private java.math.BigDecimal allotWeight;
	public java.math.BigDecimal getAllotWeight(){
		return this.allotWeight;
	}
	public void setAllotWeight(java.math.BigDecimal allotWeight){
		this.allotWeight = allotWeight;
	}
	public TechCardOrders() {
	}
}
