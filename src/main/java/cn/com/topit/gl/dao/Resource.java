package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class Resource implements GenericPojo<Long>,java.io.Serializable {
	private static final long serialVersionUID = 1L;
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
	private java.lang.String url;
	public java.lang.String getUrl(){
		return this.url;
	}
	public void setUrl(java.lang.String url){
		this.url = url;
	}
	private java.lang.Boolean type;
	public java.lang.Boolean getType(){
		return this.type;
	}
	public void setType(java.lang.Boolean type){
		this.type = type;
	}
	private java.lang.String info;
	public java.lang.String getInfo(){
		return this.info;
	}
	public void setInfo(java.lang.String info){
		this.info = info;
	}
	private java.lang.Boolean enable;
	public java.lang.Boolean getEnable(){
		return this.enable;
	}
	public void setEnable(java.lang.Boolean enable){
		this.enable = enable;
	}
	private java.lang.Integer layer;
	public java.lang.Integer getLayer(){
		return this.layer;
	}
	public void setLayer(java.lang.Integer layer){
		this.layer = layer;
	}
	private java.lang.Long parentId;
	public java.lang.Long getParentId(){
		return this.parentId;
	}
	public void setParentId(java.lang.Long parentId){
		this.parentId = parentId;
	}
	private Boolean leaf;
	public Resource() {
	}
	public Boolean getLeaf() {
		return leaf;
	}
	public void setLeaf(Boolean leaf) {
		this.leaf = leaf;
	}
	//根据角色ID判断是否可访问资源，非数据库映射字段
	private Boolean checked;
	public Boolean getChecked() {
		return checked;
	}
	public void setChecked(Boolean checked) {
		this.checked = checked;
	}
}
