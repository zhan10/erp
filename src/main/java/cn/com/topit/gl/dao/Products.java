package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class Products implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId() {
		return id;
	}
	public void setId(java.lang.Long id) {
		this.id = id;
	}
	
	private java.lang.Long productId;	
	public java.lang.Long getProductId() {
		return productId;
	}
	public void setProductId(java.lang.Long productId) {
		this.productId = productId;
	}

	private java.lang.Long floorId;	
	public java.lang.Long getFloorId() {
		return floorId;
	}
	public void setFloorId(java.lang.Long floorId) {
		this.floorId = floorId;
	}

	private java.lang.String name;	
	public java.lang.String getName() {
		return name;
	}
	public void setName(java.lang.String name) {
		this.name = name;
	}
	
	private java.lang.Integer galleryful;	
	public java.lang.Integer getGalleryful() {
		return galleryful;
	}
	public void setGalleryful(java.lang.Integer galleryful) {
		this.galleryful = galleryful;
	}
	
	private java.lang.Long genreId;
	public java.lang.Long getGenreId() {
		return genreId;
	}
	public void setGenreId(java.lang.Long genreId) {
		this.genreId = genreId;
	}

	private java.lang.Double price;	
	public java.lang.Double getPrice() {
		return price;
	}
	public void setPrice(java.lang.Double price) {
		this.price = price;
	}
	
	private Integer priceUnit;
	private Integer unit;
	

	public Integer getPriceUnit() {
		return priceUnit;
	}
	public void setPriceUnit(Integer priceUnit) {
		this.priceUnit = priceUnit;
	}
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}

	private java.lang.Integer deposit;
	public java.lang.Integer getDeposit() {
		return deposit;
	}
	public void setDeposit(java.lang.Integer deposit) {
		this.deposit = deposit;
	}
	
	private java.lang.String equipment;
	public java.lang.String getEquipment() {
		return equipment;
	}
	public void setEquipment(java.lang.String equipment) {
		this.equipment = equipment;
	}
	
	private java.lang.String pic;
	public java.lang.String getPic() {
		return pic;
	}
	public void setPic(java.lang.String pic) {
		this.pic = pic;
	}
	
	private java.lang.String intro;

	public java.lang.String getIntro() {
		return intro;
	}
	public void setIntro(java.lang.String intro) {
		this.intro = intro;
	}
	
	private java.lang.Integer minTime;
	
	public java.lang.Integer getMinTime() {
		return minTime;
	}
	public void setMinTime(java.lang.Integer minTime) {
		this.minTime = minTime;
	}
}
