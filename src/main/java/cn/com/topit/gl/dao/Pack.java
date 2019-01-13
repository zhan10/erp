package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Pack implements GenericPojo,java.io.Serializable {
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
	private java.lang.String caseNum;
	public java.lang.String getCaseNum(){
		return this.caseNum;
	}
	public void setCaseNum(java.lang.String caseNum){
		this.caseNum = caseNum;
	}
	private java.util.Date packDate;
	public java.util.Date getPackDate(){
		return this.packDate;
	}
	public void setPackDate(java.util.Date packDate){
		this.packDate = packDate;
	}
	private java.lang.String packGrade;
	public java.lang.String getPackGrade(){
		return this.packGrade;
	}
	public void setPackGrade(java.lang.String packGrade){
		this.packGrade = packGrade;
	}
	private java.lang.String faultCode;
	public java.lang.String getFaultCode(){
		return this.faultCode;
	}
	public void setFaultCode(java.lang.String faultCode){
		this.faultCode = faultCode;
	}
	private java.math.BigDecimal packThickness;
	public java.math.BigDecimal getPackThickness(){
		return this.packThickness;
	}
	public void setPackThickness(java.math.BigDecimal packThickness){
		this.packThickness = packThickness;
	}
	private java.math.BigDecimal packWidth;
	public java.math.BigDecimal getPackWidth(){
		return this.packWidth;
	}
	public void setPackWidth(java.math.BigDecimal packWidth){
		this.packWidth = packWidth;
	}
	private java.math.BigDecimal packGross;
	public java.math.BigDecimal getPackGross(){
		return this.packGross;
	}
	public void setPackGross(java.math.BigDecimal packGross){
		this.packGross = packGross;
	}
	private java.math.BigDecimal packNet;
	public java.math.BigDecimal getPackNet(){
		return this.packNet;
	}
	public void setPackNet(java.math.BigDecimal packNet){
		this.packNet = packNet;
	}
	private java.lang.Integer rolls;
	public java.lang.Integer getRolls(){
		return this.rolls;
	}
	public void setRolls(java.lang.Integer rolls){
		this.rolls = rolls;
	}
	private java.lang.String packAlloy;
	public java.lang.String getPackAlloy(){
		return this.packAlloy;
	}
	public void setPackAlloy(java.lang.String packAlloy){
		this.packAlloy = packAlloy;
	}
	private java.lang.Long produceOrderId;
	public java.lang.Long getProduceOrderId(){
		return this.produceOrderId;
	}
	public void setProduceOrderId(java.lang.Long produceOrderId){
		this.produceOrderId = produceOrderId;
	}
	private java.lang.String ordersNum;
	public java.lang.String getOrdersNum(){
		return this.ordersNum;
	}
	public void setOrdersNum(java.lang.String ordersNum){
		this.ordersNum = ordersNum;
	}
	private java.lang.Integer ordersItemId;
	public java.lang.Integer getOrdersItemId(){
		return this.ordersItemId;
	}
	public void setOrdersItemId(java.lang.Integer ordersItemId){
		this.ordersItemId = ordersItemId;
	}
	private java.lang.String packTeam;
	public java.lang.String getPackTeam(){
		return this.packTeam;
	}
	public void setPackTeam(java.lang.String packTeam){
		this.packTeam = packTeam;
	}
	private java.lang.String packTeamNum;
	public java.lang.String getPackTeamNum(){
		return this.packTeamNum;
	}
	public void setPackTeamNum(java.lang.String packTeamNum){
		this.packTeamNum = packTeamNum;
	}
	private java.lang.Boolean isPacked;
	public java.lang.Boolean getIsPacked(){
		return this.isPacked;
	}
	public void setIsPacked(java.lang.Boolean isPacked){
		this.isPacked = isPacked;
	}
	private java.lang.String frameNum;
	public java.lang.String getFrameNum(){
		return this.frameNum;
	}
	public void setFrameNum(java.lang.String frameNum){
		this.frameNum = frameNum;
	}
	private java.util.Date storeDate;
	public java.util.Date getStoreDate(){
		return this.storeDate;
	}
	public void setStoreDate(java.util.Date storeDate){
		this.storeDate = storeDate;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	public Pack() {
	}
}
