package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Roll implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long techCardId;
	public java.lang.Long getTechCardId(){
		return this.techCardId;
	}
	public void setTechCardId(java.lang.Long techCardId){
		this.techCardId = techCardId;
	}
	private java.util.Date rollDate;
	public java.util.Date getRollDate(){
		return this.rollDate;
	}
	public void setRollDate(java.util.Date rollDate){
		this.rollDate = rollDate;
	}
	private java.lang.Integer pass;
	public java.lang.Integer getPass(){
		return this.pass;
	}
	public void setPass(java.lang.Integer pass){
		this.pass = pass;
	}
	private java.lang.String smallNo;
	public java.lang.String getSmallNo(){
		return this.smallNo;
	}
	public void setSmallNo(java.lang.String smallNo){
		this.smallNo = smallNo;
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
	private java.lang.String brokenEnds;
	public java.lang.String getBrokenEnds(){
		return this.brokenEnds;
	}
	public void setBrokenEnds(java.lang.String brokenEnds){
		this.brokenEnds = brokenEnds;
	}
	private java.lang.String rackNo;
	public java.lang.String getRackNo(){
		return this.rackNo;
	}
	public void setRackNo(java.lang.String rackNo){
		this.rackNo = rackNo;
	}
	private java.lang.String operator;
	public java.lang.String getOperator(){
		return this.operator;
	}
	public void setOperator(java.lang.String operator){
		this.operator = operator;
	}
	private java.lang.Long operatorId;
	public java.lang.Long getOperatorId(){
		return this.operatorId;
	}
	public void setOperatorId(java.lang.Long operatorId){
		this.operatorId = operatorId;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	public Roll() {
	}
	private String rollMachine;
	public String getRollMachine() {
		return rollMachine;
	}
	public void setRollMachine(String rollMachine) {
		this.rollMachine = rollMachine;
	}
	private Integer rollType;
	public Integer getRollType() {
		return rollType;
	}
	public void setRollType(Integer rollType) {
		this.rollType = rollType;
	}
}
