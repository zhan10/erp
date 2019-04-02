package cn.com.topit.gl.dao;
import cn.com.topit.base.GenericPojo;
public class VErpOrders implements GenericPojo,java.io.Serializable {
	private Long id;
	private String name;
	private String mobile;
	private String address;
	private Integer status;
	private Long uid;
	private String userName;
	private String code;
	private String memo;
	private Double ordersMoney;
	private Integer cabinetQuantity;
	private String ordersCode;
	private String updateTime;
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
	public String getMobile() {
		return mobile;
	}
	public void setMobile(String mobile) {
		this.mobile = mobile;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Long getUid() {
		return uid;
	}
	public void setUid(Long uid) {
		this.uid = uid;
	}
	public String getMemo() {
		return memo;
	}
	public void setMemo(String memo) {
		this.memo = memo;
	}
	public Double getOrdersMoney() {
		return ordersMoney;
	}
	public void setOrdersMoney(Double ordersMoney) {
		this.ordersMoney = ordersMoney;
	}
	public Integer getCabinetQuantity() {
		return cabinetQuantity;
	}
	public void setCabinetQuantity(Integer cabinetQuantity) {
		this.cabinetQuantity = cabinetQuantity;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getOrdersCode() {
		return ordersCode;
	}
	public void setOrdersCode(String ordersCode) {
		this.ordersCode = ordersCode;
	}
	public String getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(String updateTime) {
		this.updateTime = updateTime;
	}
	public VErpOrders() {
	}
	
}
