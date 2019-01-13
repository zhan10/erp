package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VRecipe implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.String typeName;
	public java.lang.String getTypeName(){
		return this.typeName;
	}
	public void setTypeName(java.lang.String typeName){
		this.typeName = typeName;
	}
	private java.lang.Integer spicy;
	public java.lang.Integer getSpicy(){
		return this.spicy;
	}
	public void setSpicy(java.lang.Integer spicy){
		this.spicy = spicy;
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
	private java.lang.String keyword;
	public java.lang.String getKeyword(){
		return this.keyword;
	}
	public void setKeyword(java.lang.String keyword){
		this.keyword = keyword;
	}
	private java.lang.String pic;
	public java.lang.String getPic(){
		return this.pic;
	}
	public void setPic(java.lang.String pic){
		this.pic = pic;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	private java.lang.Integer recipeType;
	public java.lang.Integer getRecipeType(){
		return this.recipeType;
	}
	public void setRecipeType(java.lang.Integer recipeType){
		this.recipeType = recipeType;
	}
	private java.lang.String cityName;
	public java.lang.String getCityName() {
		return cityName;
	}
	public void setCityName(java.lang.String cityName) {
		this.cityName = cityName;
	}
	private java.lang.String buildingName;
	public java.lang.String getBuildingName() {
		return buildingName;
	}
	public void setBuildingName(java.lang.String buildingName) {
		this.buildingName = buildingName;
	}
	private java.lang.String areaName;
	public java.lang.String getAreaName() {
		return areaName;
	}
	public void setAreaName(java.lang.String areaName) {
		this.areaName = areaName;
	}
	private java.lang.Integer buildingId;
	private java.lang.Integer areaId;
	private java.lang.Integer cityId;
	
	public java.lang.Integer getBuildingId() {
		return buildingId;
	}
	public void setBuildingId(java.lang.Integer buildingId) {
		this.buildingId = buildingId;
	}
	public java.lang.Integer getCityId() {
		return cityId;
	}
	public void setCityId(java.lang.Integer cityId) {
		this.cityId = cityId;
	}
	public VRecipe() {
	}
}
