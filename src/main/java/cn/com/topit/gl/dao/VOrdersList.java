package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VOrdersList implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
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
	private java.lang.String recipeName;
	public java.lang.String getRecipeName(){
		return this.recipeName;
	}
	public void setRecipeName(java.lang.String recipeName){
		this.recipeName = recipeName;
	}
	private java.lang.Double price;
	public java.lang.Double getPrice(){
		return this.price;
	}
	public void setPrice(java.lang.Double price){
		this.price = price;
	}
	private java.lang.String consumerName;
	public java.lang.String getConsumerName(){
		return this.consumerName;
	}
	public void setConsumerName(java.lang.String consumerName){
		this.consumerName = consumerName;
	}
	private java.lang.String address;
	public java.lang.String getAddress(){
		return this.address;
	}
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	private java.util.Date ordersTime;
	public java.util.Date getOrdersTime(){
		return this.ordersTime;
	}
	public void setOrdersTime(java.util.Date ordersTime){
		this.ordersTime = ordersTime;
	}
	private java.lang.Long recipeId;
	public java.lang.Long getRecipeId(){
		return this.recipeId;
	}
	public void setRecipeId(java.lang.Long recipeId){
		this.recipeId = recipeId;
	}
	private java.lang.Long consumerId;
	public java.lang.Long getConsumerId(){
		return this.consumerId;
	}
	public void setConsumerId(java.lang.Long consumerId){
		this.consumerId = consumerId;
	}
	private java.lang.Long bookingId;
	public java.lang.Long getBookingId(){
		return this.bookingId;
	}
	public void setBookingId(java.lang.Long bookingId){
		this.bookingId = bookingId;
	}
	private java.lang.Long buildingId;
	public java.lang.Long getBuildingId(){
		return this.buildingId;
	}
	public void setBuildingId(java.lang.Long buildingId){
		this.buildingId = buildingId;
	}
	private java.lang.Long ordersId;
	public java.lang.Long getOrdersId(){
		return this.ordersId;
	}
	public void setOrdersId(java.lang.Long ordersId){
		this.ordersId = ordersId;
	}
	private java.lang.Integer status;
	public java.lang.Integer getStatus(){
		return this.status;
	}
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	public VOrdersList() {
	}
	private String code;
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	private String tel;
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
}
