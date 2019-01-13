package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class UserRole implements GenericPojo,java.io.Serializable {
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
	private java.lang.Long roleId;
	public java.lang.Long getRoleId(){
		return this.roleId;
	}
	public void setRoleId(java.lang.Long roleId){
		this.roleId = roleId;
	}
	public UserRole() {
	}
}
