package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class Health implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
	public java.lang.Long getId(){
		return this.id;
	}
	public void setId(java.lang.Long id){
		this.id = id;
	}
	private java.lang.Long userId;
	public java.lang.Long getUserId(){
		return this.userId;
	}
	public void setUserId(java.lang.Long userId){
		this.userId = userId;
	}
	private java.util.Date checkedTime;
	public java.util.Date getCheckedTime(){
		return this.checkedTime;
	}
	public void setCheckedTime(java.util.Date checkedTime){
		this.checkedTime = checkedTime;
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
	private java.lang.Integer pulse;
	public java.lang.Integer getPulse(){
		return this.pulse;
	}
	public void setPulse(java.lang.Integer pulse){
		this.pulse = pulse;
	}
	public Health() {
	}
}
