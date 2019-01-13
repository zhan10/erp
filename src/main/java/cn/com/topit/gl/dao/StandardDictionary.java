package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class StandardDictionary implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.String purpose;
	public java.lang.String getPurpose(){
		return this.purpose;
	}
	public void setPurpose(java.lang.String purpose){
		this.purpose = purpose;
	}
	private java.math.BigDecimal spec1;
	public java.math.BigDecimal getSpec1(){
		return this.spec1;
	}
	public void setSpec1(java.math.BigDecimal spec1){
		this.spec1 = spec1;
	}
	private java.math.BigDecimal spec2;
	public java.math.BigDecimal getSpec2(){
		return this.spec2;
	}
	public void setSpec2(java.math.BigDecimal spec2){
		this.spec2 = spec2;
	}
	private java.lang.String alloyModel;
	public java.lang.String getAlloyModel(){
		return this.alloyModel;
	}
	public void setAlloyModel(java.lang.String alloyModel){
		this.alloyModel = alloyModel;
	}
	private java.lang.String alloyStatus;
	public java.lang.String getAlloyStatus(){
		return this.alloyStatus;
	}
	public void setAlloyStatus(java.lang.String alloyStatus){
		this.alloyStatus = alloyStatus;
	}
	private java.lang.String thicknessTolerance;
	public java.lang.String getThicknessTolerance(){
		return this.thicknessTolerance;
	}
	public void setThicknessTolerance(java.lang.String thicknessTolerance){
		this.thicknessTolerance = thicknessTolerance;
	}
	private java.lang.String widthTolerance;
	public java.lang.String getWidthTolerance(){
		return this.widthTolerance;
	}
	public void setWidthTolerance(java.lang.String widthTolerance){
		this.widthTolerance = widthTolerance;
	}
	private java.lang.String outerDiameter;
	public java.lang.String getOuterDiameter(){
		return this.outerDiameter;
	}
	public void setOuterDiameter(java.lang.String outerDiameter){
		this.outerDiameter = outerDiameter;
	}
	private java.lang.String innerDiameter;
	public java.lang.String getInnerDiameter(){
		return this.innerDiameter;
	}
	public void setInnerDiameter(java.lang.String innerDiameter){
		this.innerDiameter = innerDiameter;
	}
	private java.lang.String jointNum;
	public java.lang.String getJointNum(){
		return this.jointNum;
	}
	public void setJointNum(java.lang.String jointNum){
		this.jointNum = jointNum;
	}
	private java.lang.String pinholeNum;
	public java.lang.String getPinholeNum(){
		return this.pinholeNum;
	}
	public void setPinholeNum(java.lang.String pinholeNum){
		this.pinholeNum = pinholeNum;
	}
	private java.lang.String wettability;
	public java.lang.String getWettability(){
		return this.wettability;
	}
	public void setWettability(java.lang.String wettability){
		this.wettability = wettability;
	}
	private java.lang.String tensileStrength;
	public java.lang.String getTensileStrength(){
		return this.tensileStrength;
	}
	public void setTensileStrength(java.lang.String tensileStrength){
		this.tensileStrength = tensileStrength;
	}
	private java.lang.String extensibility;
	public java.lang.String getExtensibility(){
		return this.extensibility;
	}
	public void setExtensibility(java.lang.String extensibility){
		this.extensibility = extensibility;
	}
	private java.lang.String sideSpread;
	public java.lang.String getSideSpread(){
		return this.sideSpread;
	}
	public void setSideSpread(java.lang.String sideSpread){
		this.sideSpread = sideSpread;
	}
	private java.lang.String wholeSpread;
	public java.lang.String getWholeSpread(){
		return this.wholeSpread;
	}
	public void setWholeSpread(java.lang.String wholeSpread){
		this.wholeSpread = wholeSpread;
	}
	private java.lang.Integer length;
	public java.lang.Integer getLength(){
		return this.length;
	}
	public void setLength(java.lang.Integer length){
		this.length = length;
	}
	private java.lang.String lengthTolerance;
	public java.lang.String getLengthTolerance(){
		return this.lengthTolerance;
	}
	public void setLengthTolerance(java.lang.String lengthTolerance){
		this.lengthTolerance = lengthTolerance;
	}
	private java.lang.String appearance;
	public java.lang.String getAppearance(){
		return this.appearance;
	}
	public void setAppearance(java.lang.String appearance){
		this.appearance = appearance;
	}
	private java.lang.String otherStandard;
	public java.lang.String getOtherStandard(){
		return this.otherStandard;
	}
	public void setOtherStandard(java.lang.String otherStandard){
		this.otherStandard = otherStandard;
	}
	private java.lang.String specialReq;
	public java.lang.String getSpecialReq(){
		return this.specialReq;
	}
	public void setSpecialReq(java.lang.String specialReq){
		this.specialReq = specialReq;
	}
	public StandardDictionary() {
	}
}
