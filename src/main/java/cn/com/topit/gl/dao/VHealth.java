package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VHealth implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.util.Date checkedTime;
	public java.util.Date getCheckedTime(){
		return this.checkedTime;
	}
	public void setCheckedTime(java.util.Date checkedTime){
		this.checkedTime = checkedTime;
	}
	private java.lang.String name;
	public java.lang.String getName(){
		return this.name;
	}
	public void setName(java.lang.String name){
		this.name = name;
	}
	private java.lang.Boolean sex;
	public java.lang.Boolean getSex(){
		return this.sex;
	}
	public void setSex(java.lang.Boolean sex){
		this.sex = sex;
	}
	private java.util.Date birth;
	public java.util.Date getBirth(){
		return this.birth;
	}
	public void setBirth(java.util.Date birth){
		this.birth = birth;
	}
	private java.lang.Integer certificate;
	public java.lang.Integer getCertificate(){
		return this.certificate;
	}
	public void setCertificate(java.lang.Integer certificate){
		this.certificate = certificate;
	}
	private java.lang.String certificateCode;
	public java.lang.String getCertificateCode(){
		return this.certificateCode;
	}
	public void setCertificateCode(java.lang.String certificateCode){
		this.certificateCode = certificateCode;
	}
	private java.lang.String tel;
	public java.lang.String getTel(){
		return this.tel;
	}
	public void setTel(java.lang.String tel){
		this.tel = tel;
	}
	private java.lang.String email;
	public java.lang.String getEmail(){
		return this.email;
	}
	public void setEmail(java.lang.String email){
		this.email = email;
	}
	private java.lang.String address;
	public java.lang.String getAddress(){
		return this.address;
	}
	public void setAddress(java.lang.String address){
		this.address = address;
	}
	private java.lang.Integer cardType;
	public java.lang.Integer getCardType(){
		return this.cardType;
	}
	public void setCardType(java.lang.Integer cardType){
		this.cardType = cardType;
	}
	private java.lang.String cardCode;
	public java.lang.String getCardCode(){
		return this.cardCode;
	}
	public void setCardCode(java.lang.String cardCode){
		this.cardCode = cardCode;
	}
	private java.lang.Integer height;
	public java.lang.Integer getHeight(){
		return this.height;
	}
	public void setHeight(java.lang.Integer height){
		this.height = height;
	}
	private java.lang.Double weight;
	public java.lang.Double getWeight(){
		return this.weight;
	}
	public void setWeight(java.lang.Double weight){
		this.weight = weight;
	}
	private java.lang.Integer pulse;
	public java.lang.Integer getPulse(){
		return this.pulse;
	}
	public void setPulse(java.lang.Integer pulse){
		this.pulse = pulse;
	}
	private java.lang.Integer diastolicPressure;
	public java.lang.Integer getDiastolicPressure(){
		return this.diastolicPressure;
	}
	public void setDiastolicPressure(java.lang.Integer diastolicPressure){
		this.diastolicPressure = diastolicPressure;
	}
	private java.lang.Integer systolicPressure;
	public java.lang.Integer getSystolicPressure(){
		return this.systolicPressure;
	}
	public void setSystolicPressure(java.lang.Integer systolicPressure){
		this.systolicPressure = systolicPressure;
	}
	private java.lang.Integer bodyFatRatio;
	public java.lang.Integer getBodyFatRatio(){
		return this.bodyFatRatio;
	}
	public void setBodyFatRatio(java.lang.Integer bodyFatRatio){
		this.bodyFatRatio = bodyFatRatio;
	}
	private java.lang.Integer oxygenSaturation;
	public java.lang.Integer getOxygenSaturation(){
		return this.oxygenSaturation;
	}
	public void setOxygenSaturation(java.lang.Integer oxygenSaturation){
		this.oxygenSaturation = oxygenSaturation;
	}
	private java.lang.Long userId;
	public java.lang.Long getUserId(){
		return this.userId;
	}
	public void setUserId(java.lang.Long userId){
		this.userId = userId;
	}
	public VHealth() {
	}
}
