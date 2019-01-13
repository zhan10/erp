package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class InStorePlan implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.String code;
	public java.lang.String getCode(){
		return this.code;
	}
	public void setCode(java.lang.String code){
		this.code = code;
	}
	private java.lang.String deliverDept;
	public java.lang.String getDeliverDept(){
		return this.deliverDept;
	}
	public void setDeliverDept(java.lang.String deliverDept){
		this.deliverDept = deliverDept;
	}
	private java.lang.String sourceType;
	public java.lang.String getSourceType(){
		return this.sourceType;
	}
	public void setSourceType(java.lang.String sourceType){
		this.sourceType = sourceType;
	}
	private java.lang.String sourceCode;
	public java.lang.String getSourceCode(){
		return this.sourceCode;
	}
	public void setSourceCode(java.lang.String sourceCode){
		this.sourceCode = sourceCode;
	}
	private java.lang.String storeDate;
	public java.lang.String getStoreDate(){
		return this.storeDate;
	}
	public void setStoreDate(java.lang.String storeDate){
		this.storeDate = storeDate;
	}
	private java.lang.String checkDate;
	public java.lang.String getCheckDate(){
		return this.checkDate;
	}
	public void setCheckDate(java.lang.String checkDate){
		this.checkDate = checkDate;
	}
	private java.lang.Integer status;
	public java.lang.Integer getStatus(){
		return this.status;
	}
	public void setStatus(java.lang.Integer status){
		this.status = status;
	}
	private java.lang.Integer storeType;
	public java.lang.Integer getStoreType(){
		return this.storeType;
	}
	public void setStoreType(java.lang.Integer storeType){
		this.storeType = storeType;
	}
	private java.lang.Long storeId;
	public java.lang.Long getStoreId(){
		return this.storeId;
	}
	public void setStoreId(java.lang.Long storeId){
		this.storeId = storeId;
	}
	private java.lang.Long inputer;
	public java.lang.Long getInputer(){
		return this.inputer;
	}
	public void setInputer(java.lang.Long inputer){
		this.inputer = inputer;
	}
	private java.lang.Long checker;
	public java.lang.Long getChecker(){
		return this.checker;
	}
	public void setChecker(java.lang.Long checker){
		this.checker = checker;
	}
	private java.lang.Long accepter;
	public java.lang.Long getAccepter(){
		return this.accepter;
	}
	public void setAccepter(java.lang.Long accepter){
		this.accepter = accepter;
	}
	private java.lang.Long deliver;
	public java.lang.Long getDeliver(){
		return this.deliver;
	}
	public void setDeliver(java.lang.Long deliver){
		this.deliver = deliver;
	}
	private java.lang.String inputDate;
	public java.lang.String getInputDate(){
		return this.inputDate;
	}
	public void setInputDate(java.lang.String inputDate){
		this.inputDate = inputDate;
	}
	private java.lang.Integer caseNum;
	public java.lang.Integer getCaseNum(){
		return this.caseNum;
	}
	public void setCaseNum(java.lang.Integer caseNum){
		this.caseNum = caseNum;
	}
	private java.math.BigDecimal sumWeight;
	public java.math.BigDecimal getSumWeight(){
		return this.sumWeight;
	}
	public void setSumWeight(java.math.BigDecimal sumWeight){
		this.sumWeight = sumWeight;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	public InStorePlan() {
	}
}
