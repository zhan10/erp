package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class OfficeType implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	private Double price;
	private Double priceAll;
	private Integer proportion;
	private Integer deposit;
	
	public Integer getDeposit() {
		return deposit;
	}
	public void setDeposit(Integer deposit) {
		this.deposit = deposit;
	}
	public Double getPriceAll() {
		return priceAll;
	}
	public void setPriceAll(Double priceAll) {
		this.priceAll = priceAll;
	}
	public Integer getProportion() {
		return proportion;
	}
	public void setProportion(Integer proportion) {
		this.proportion = proportion;
	}
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
	private java.lang.String intro;
	public java.lang.String getIntro(){
		return this.intro;
	}
	public void setIntro(java.lang.String intro){
		this.intro = intro;
	}
	public OfficeType() {
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	private Integer unit;
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}
	
	
}
