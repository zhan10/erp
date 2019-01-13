package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class MateType implements GenericPojo,java.io.Serializable {
	private Long id;
	private String matetypeid;
	private String matertypename;
	private String description;
	private boolean isend;
	private short grade;
	private String parentid;

	

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getMatetypeid() {
		return matetypeid;
	}

	public void setMatetypeid(String matetypeid) {
		this.matetypeid = matetypeid;
	}

	public String getMatertypename() {
		return matertypename;
	}

	public void setMatertypename(String matertypename) {
		this.matertypename = matertypename;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public boolean isIsend() {
		return isend;
	}

	public void setIsend(boolean isend) {
		this.isend = isend;
	}

	public short getGrade() {
		return grade;
	}

	public void setGrade(short grade) {
		this.grade = grade;
	}

	public String getParentid() {
		return parentid;
	}

	public void setParentid(String parentid) {
		this.parentid = parentid;
	}

	public MateType() {
	}
}
