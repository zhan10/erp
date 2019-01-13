package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class OrdersList implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long ordersId;
	public java.lang.Long getOrdersId(){
		return this.ordersId;
	}
	public void setOrdersId(java.lang.Long ordersId){
		this.ordersId = ordersId;
	}
	private java.lang.Long recipeId;
	public java.lang.Long getRecipeId(){
		return this.recipeId;
	}
	public void setRecipeId(java.lang.Long recipeId){
		this.recipeId = recipeId;
	}
	private java.lang.Integer numbers;
	public java.lang.Integer getNumbers(){
		return this.numbers;
	}
	public void setNumbers(java.lang.Integer numbers){
		this.numbers = numbers;
	}
	private java.lang.Double total;
	public java.lang.Double getTotal(){
		return this.total;
	}
	public void setTotal(java.lang.Double total){
		this.total = total;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	public OrdersList() {
	}
}
