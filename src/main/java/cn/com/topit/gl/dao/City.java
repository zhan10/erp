package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class City implements GenericPojo,java.io.Serializable {
	private java.lang.Long id;
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
	private java.lang.String pic;
	public java.lang.String getPic(){
		return this.pic;
	}
	public void setPic(java.lang.String pic){
		this.pic = pic;
	}
	private java.lang.String serviceName;
	public java.lang.String getServiceName(){
		return this.serviceName;
	}
	public void setServiceName(java.lang.String serviceName){
		this.serviceName = serviceName;
	}
	private java.lang.String serviceTel;
	public java.lang.String getServiceTel(){
		return this.serviceTel;
	}
	public void setServiceTel(java.lang.String serviceTel){
		this.serviceTel = serviceTel;
	}
	public City() {
	}
}
