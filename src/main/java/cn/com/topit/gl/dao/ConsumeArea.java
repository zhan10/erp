package cn.com.topit.gl.dao;

import cn.com.topit.base.GenericPojo;

public class ConsumeArea implements GenericPojo, java.io.Serializable{

	private static final long serialVersionUID = 1L;
	private Long id;
	private String name;
	private String intro;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getIntro() {
		return intro;
	}
	public void setIntro(String intro) {
		this.intro = intro;
	}
}
