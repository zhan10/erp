package cn.com.topit.gl.dao;
import java.util.Date;

import cn.com.topit.base.GenericPojo;
public class ErpCabinet implements GenericPojo,java.io.Serializable {
	private Long id;
	private Long ordersId;
	private String room;
	private String name;
	private String mainMater;
	private String decompose;
	
	public Long getOrdersId() {
		return ordersId;
	}

	public void setOrdersId(Long ordersId) {
		this.ordersId = ordersId;
	}

	public Long getId() {
		return id;
	}

	public void setId(Long id) {
		this.id = id;
	}

	public String getRoom() {
		return room;
	}

	public void setRoom(String room) {
		this.room = room;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getMainMater() {
		return mainMater;
	}

	public void setMainMater(String mainMater) {
		this.mainMater = mainMater;
	}

	public String getDecompose() {
		return decompose;
	}

	public void setDecompose(String decompose) {
		this.decompose = decompose;
	}

	public ErpCabinet() {
		
	}
}
