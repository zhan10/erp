package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class TechCard implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Integer status;
	public java.lang.Integer getStatus(){
		return this.status;
	}
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	private java.lang.Integer checkStatus;
	public java.lang.Integer getCheckStatus(){
		return this.checkStatus;
	}
	public void setCheckStatus(java.lang.Integer checkStatus){
		this.checkStatus = checkStatus;
	}
	private java.lang.String alNo;
	public java.lang.String getAlNo(){
		return this.alNo;
	}
	public void setAlNo(java.lang.String alNo){
		this.alNo = alNo;
	}
	private java.lang.String billetNo;
	public java.lang.String getBilletNo(){
		return this.billetNo;
	}
	public void setBilletNo(java.lang.String billetNo){
		this.billetNo = billetNo;
	}
	private java.lang.String rackNo;
	public java.lang.String getRackNo(){
		return this.rackNo;
	}
	public void setRackNo(java.lang.String rackNo){
		this.rackNo = rackNo;
	}
	private java.lang.String alloyModel;
	public java.lang.String getAlloyModel(){
		return this.alloyModel;
	}
	public void setAlloyModel(java.lang.String alloyModel){
		this.alloyModel = alloyModel;
	}
	private java.math.BigDecimal billetWeight;
	public java.math.BigDecimal getBilletWeight(){
		return this.billetWeight;
	}
	public void setBilletWeight(java.math.BigDecimal billetWeight){
		this.billetWeight = billetWeight;
	}
	private java.math.BigDecimal allotWeight;
	public java.math.BigDecimal getAllotWeight(){
		return this.allotWeight;
	}
	public void setAllotWeight(java.math.BigDecimal allotWeight){
		this.allotWeight = allotWeight;
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
	private java.lang.String produceReq;
	public java.lang.String getProduceReq(){
		return this.produceReq;
	}
	public void setProduceReq(java.lang.String produceReq){
		this.produceReq = produceReq;
	}
	private java.lang.String planMan;
	public java.lang.String getPlanMan(){
		return this.planMan;
	}
	public void setPlanMan(java.lang.String planMan){
		this.planMan = planMan;
	}
	private java.lang.Long planManId;
	public java.lang.Long getPlanManId(){
		return this.planManId;
	}
	public void setPlanManId(java.lang.Long planManId){
		this.planManId = planManId;
	}
	private java.util.Date produceDate;
	public java.util.Date getProduceDate(){
		return this.produceDate;
	}
	public void setProduceDate(java.util.Date produceDate){
		this.produceDate = produceDate;
	}
	private java.lang.String techReq;
	public java.lang.String getTechReq(){
		return this.techReq;
	}
	public void setTechReq(java.lang.String techReq){
		this.techReq = techReq;
	}
	private java.lang.String technician;
	public java.lang.String getTechnician(){
		return this.technician;
	}
	public void setTechnician(java.lang.String technician){
		this.technician = technician;
	}
	private java.lang.Long technicianId;
	public java.lang.Long getTechnicianId(){
		return this.technicianId;
	}
	public void setTechnicianId(java.lang.Long technicianId){
		this.technicianId = technicianId;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	public TechCard() {
	}
}
