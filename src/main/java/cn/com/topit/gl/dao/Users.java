package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;
import cn.com.topit.common.util.MD5;

public class Users implements GenericPojo<Long>, java.io.Serializable {
    private static final long serialVersionUID = 1L;
    private java.lang.Long id;

    public java.lang.Long getId() {
	return this.id;
    }

    public void setId(java.lang.Long id) {
	this.id = id;
    }

    private java.lang.String name;

    public java.lang.String getName() {
	return this.name;
    }

    public void setName(java.lang.String name) {
	this.name = name;
    }

    private java.lang.String code;

    public java.lang.String getCode() {
	return this.code;
    }

    public void setCode(java.lang.String code) {
	this.code = code;
    }

    private java.lang.String password;

    public java.lang.String getPassword() {
	return this.password;
    }

    public void setPassword(java.lang.String password) {
	
	this.password=password;
    }

    private java.util.Date birth;

    public java.util.Date getBirth() {
	return this.birth;
    }

    public void setBirth(java.util.Date birth) {
	this.birth = birth;
    }

	private java.lang.Boolean sex;

    public java.lang.Boolean getSex() {
	return this.sex;
    }

    public void setSex(java.lang.Boolean sex) {
	this.sex = sex;
    }

    private java.lang.Long dept;

    public java.lang.Long getDept() {
	return this.dept;
    }

    public void setDept(java.lang.Long dept) {
	this.dept = dept;
    }

    private java.lang.Boolean enable;

    public java.lang.Boolean getEnable() {
	return this.enable;
    }

    public void setEnable(java.lang.Boolean enable) {
	this.enable = enable;
    }

    private java.lang.Integer status;

    public java.lang.Integer getStatus() {
	return this.status;
    }

    public void setStatus(java.lang.Integer status) {
	this.status = status;
    }

    public Users() {
    }

    // 使用hibernate只查询id\name两个字段时所需的构造函数
    public Users(Long id, String name) {
	this.id = id;
	this.name = name;
    }
    /*
     * security3中配置一个用户不能同时在两点登录 即<concurrency-control max-sessions="1"
     * error-if-maximum-exceeded="true"/> 时不起作用，必须重写一下User的hashcode，equals方法
     */
    /*
     * @Override public int hashCode() { return code.hashCode(); }
     * 
     * @Override public boolean equals(Object obj) { Users user = (Users) obj;
     * return this.code.equals(user.getCode()); }
     */
}
