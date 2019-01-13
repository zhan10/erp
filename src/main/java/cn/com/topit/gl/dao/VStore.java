package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VStore implements GenericPojo,java.io.Serializable {
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
	private java.lang.Long manager;
	public java.lang.Long getManager(){
		return this.manager;
	}
	public void setManager(java.lang.Long manager){
		this.manager = manager;
	}
	private java.lang.String position;
	public java.lang.String getPosition(){
		return this.position;
	}
	public void setPosition(java.lang.String position){
		this.position = position;
	}
	private java.lang.String memo;
	public java.lang.String getMemo(){
		return this.memo;
	}
	public void setMemo(java.lang.String memo){
		this.memo = memo;
	}
	private java.lang.String userName;
	public java.lang.String getUserName(){
		return this.userName;
	}
	public void setUserName(java.lang.String userName){
		this.userName = userName;
	}
	public VStore() {
	}
}
