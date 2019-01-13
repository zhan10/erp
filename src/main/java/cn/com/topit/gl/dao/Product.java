package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Product implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long billetId;
	public java.lang.Long getBilletId(){
		return this.billetId;
	}
	public void setBilletId(java.lang.Long billetId){
		this.billetId = billetId;
	}
	private java.lang.Long batchId;
	public java.lang.Long getBatchId(){
		return this.batchId;
	}
	public void setBatchId(java.lang.Long batchId){
		this.batchId = batchId;
	}
	private java.lang.String cutCode;
	public java.lang.String getCutCode(){
		return this.cutCode;
	}
	public void setCutCode(java.lang.String cutCode){
		this.cutCode = cutCode;
	}
	private java.lang.Long orderItemId;
	public java.lang.Long getOrderItemId(){
		return this.orderItemId;
	}
	public void setOrderItemId(java.lang.Long orderItemId){
		this.orderItemId = orderItemId;
	}
	private java.math.BigDecimal length;
	public java.math.BigDecimal getLength(){
		return this.length;
	}
	public void setLength(java.math.BigDecimal length){
		this.length = length;
	}
	private java.math.BigDecimal thickness;
	public java.math.BigDecimal getThickness(){
		return this.thickness;
	}
	public void setThickness(java.math.BigDecimal thickness){
		this.thickness = thickness;
	}
	private java.math.BigDecimal width;
	public java.math.BigDecimal getWidth(){
		return this.width;
	}
	public void setWidth(java.math.BigDecimal width){
		this.width = width;
	}
	private java.math.BigDecimal weight;
	public java.math.BigDecimal getWeight(){
		return this.weight;
	}
	public void setWeight(java.math.BigDecimal weight){
		this.weight = weight;
	}
	private java.lang.Integer status;
	public java.lang.Integer getStatus(){
		return this.status;
	}
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	private java.lang.Long produceOrderId;
	public java.lang.Long getProduceOrderId(){
		return this.produceOrderId;
	}
	public void setProduceOrderId(java.lang.Long produceOrderId){
		this.produceOrderId = produceOrderId;
	}
	public Product() {
	}
}
