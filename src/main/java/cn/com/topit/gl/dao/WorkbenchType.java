package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class WorkbenchType implements GenericPojo, java.io.Serializable {
	private java.lang.Long id;

	public java.lang.Long getId() {
		return this.id;
	}

	public void setId(java.lang.Long id) {
		this.id = id;
	}
	
	private Integer buildingId;
	
	private Integer floorId;
	
	private java.lang.String equipment;
    
	private java.lang.String pic;
	
	private java.lang.String bigPic;
	
	private java.lang.String leftPic;
	
	private java.lang.String midPic;
	
	private java.lang.String rightPic;
	
	private java.lang.String planePic;
	
	private java.lang.String buildingName;
	
	private java.lang.String floorName;
	
	
	
	public java.lang.String getBuildingName() {
		return buildingName;
	}

	public void setBuildingName(java.lang.String buildingName) {
		this.buildingName = buildingName;
	}

	public java.lang.String getFloorName() {
		return floorName;
	}

	public void setFloorName(java.lang.String floorName) {
		this.floorName = floorName;
	}

	public Integer getBuildingId() {
		return buildingId;
	}

	public void setBuildingId(Integer buildingId) {
		this.buildingId = buildingId;
	}

	public Integer getFloorId() {
		return floorId;
	}

	public void setFloorId(Integer floorId) {
		this.floorId = floorId;
	}

	public java.lang.String getEquipment() {
		return equipment;
	}

	public void setEquipment(java.lang.String equipment) {
		this.equipment = equipment;
	}

	public java.lang.String getPic() {
		return pic;
	}

	public void setPic(java.lang.String pic) {
		this.pic = pic;
	}

	public java.lang.String getBigPic() {
		return bigPic;
	}

	public void setBigPic(java.lang.String bigPic) {
		this.bigPic = bigPic;
	}

	public java.lang.String getLeftPic() {
		return leftPic;
	}

	public void setLeftPic(java.lang.String leftPic) {
		this.leftPic = leftPic;
	}

	public java.lang.String getMidPic() {
		return midPic;
	}

	public void setMidPic(java.lang.String midPic) {
		this.midPic = midPic;
	}

	public java.lang.String getRightPic() {
		return rightPic;
	}

	public void setRightPic(java.lang.String rightPic) {
		this.rightPic = rightPic;
	}

	public java.lang.String getPlanePic() {
		return planePic;
	}

	public void setPlanePic(java.lang.String planePic) {
		this.planePic = planePic;
	}

	private java.lang.String name;

	public java.lang.String getName() {
		return this.name;
	}

	public void setName(java.lang.String name) {
		this.name = name;
	}

	private java.lang.String intro;

	public java.lang.String getIntro() {
		return this.intro;
	}

	public void setIntro(java.lang.String intro) {
		this.intro = intro;
	}

	private Double price;

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}
	private Double deposit;
	
	public Double getDeposit() {
		return deposit;
	}

	public void setDeposit(Double deposit) {
		this.deposit = deposit;
	}
	private Integer unit;
	public Integer getUnit() {
		return unit;
	}
	public void setUnit(Integer unit) {
		this.unit = unit;
	}	
	private Integer count;
	
	public Integer getCount() {
		return count;
	}

	public void setCount(Integer count) {
		this.count = count;
	}
	
	private String acreage;
	
	public String getAcreage() {
		return acreage;
	}

	public void setAcreage(String acreage) {
		this.acreage = acreage;
	}

	public WorkbenchType() {
	}
}
