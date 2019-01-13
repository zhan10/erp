package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class VConsumeRecord implements GenericPojo, java.io.Serializable {
	private Long id;
	//是否结算
	private Boolean balance;
	//消费者名称
	private String consumerName;
	//消费名称
	private String consumeName;
	//消费金额
	private Double consumeAmount;
	//支付名称
	private String paymentName;
	//收款人
	private String usersName;
	//订单编号
	private String bookingCode;
	//消费开始时间
	private Date consumeFrom;
	//消费截至时间
	private Date consumeTo;
	//消费者ID
	private Long consumerId;
	//订单ID
	private Long bookingId;
	//相关记录ID
	private Long relatedId;
	//相关记录类型
	private Integer relatedType;
	//消费类型ID
	private Long consumeTypeId;
	//支付类型ID
	private Long paymentTypeId;
	//收款人ID
	//private Long usersId;
	//订单编号消费状态
	private Boolean bookingBalance;
	//消费区域ID
	private Long consumeAreaId;
	//消费区域
	private String consumeAreaName;
	private Double price;
	private String usersCode;
	private Integer number;
	
	public String getUsersCode() {
		return usersCode;
	}
	public void setUsersCode(String usersCode) {
		this.usersCode = usersCode;
	}
	public Double getPrice() {
		return price;
	}
	public void setPrice(Double price) {
		this.price = price;
	}
	public Long getConsumeAreaId() {
		return consumeAreaId;
	}
	public void setConsumeAreaId(Long consumeAreaId) {
		this.consumeAreaId = consumeAreaId;
	}
	public String getConsumeAreaName() {
		return consumeAreaName;
	}
	public void setConsumeAreaName(String consumeAreaName) {
		this.consumeAreaName = consumeAreaName;
	}
	public Boolean getBookingBalance() {
		return bookingBalance;
	}
	public void setBookingBalance(Boolean bookingBalance) {
		this.bookingBalance = bookingBalance;
	}
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
	}
	public Boolean getBalance() {
		return balance;
	}
	public void setBalance(Boolean balance) {
		this.balance = balance;
	}
	public String getConsumerName() {
		return consumerName;
	}
	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}
	public String getConsumeName() {
		return consumeName;
	}
	public void setConsumeName(String consumeName) {
		this.consumeName = consumeName;
	}
	public Double getConsumeAmount() {
		return consumeAmount;
	}
	public void setConsumeAmount(Double consumeAmount) {
		this.consumeAmount = consumeAmount;
	}
	public String getPaymentName() {
		return paymentName;
	}
	public void setPaymentName(String paymentName) {
		this.paymentName = paymentName;
	}
	public String getUsersName() {
		return usersName;
	}
	public void setUsersName(String usersName) {
		this.usersName = usersName;
	}
	public String getBookingCode() {
		return bookingCode;
	}
	public void setBookingCode(String bookingCode) {
		this.bookingCode = bookingCode;
	}
	public Date getConsumeFrom() {
		return consumeFrom;
	}
	public void setConsumeFrom(Date consumeFrom) {
		this.consumeFrom = consumeFrom;
	}
	public Date getConsumeTo() {
		return consumeTo;
	}
	public void setConsumeTo(Date consumeTo) {
		this.consumeTo = consumeTo;
	}
	public Long getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(Long consumerId) {
		this.consumerId = consumerId;
	}
	public Long getBookingId() {
		return bookingId;
	}
	public void setBookingId(Long bookingId) {
		this.bookingId = bookingId;
	}
	public Long getRelatedId() {
		return relatedId;
	}
	public void setRelatedId(Long relatedId) {
		this.relatedId = relatedId;
	}
	public Integer getRelatedType() {
		return relatedType;
	}
	public void setRelatedType(Integer relatedType) {
		this.relatedType = relatedType;
	}
	public Long getConsumeTypeId() {
		return consumeTypeId;
	}
	public void setConsumeTypeId(Long consumeTypeId) {
		this.consumeTypeId = consumeTypeId;
	}
	public Long getPaymentTypeId() {
		return paymentTypeId;
	}
	public void setPaymentTypeId(Long paymentTypeId) {
		this.paymentTypeId = paymentTypeId;
	}
	/*public Long getUsersId() {
		return usersId;
	}
	public void setUsersId(Long usersId) {
		this.usersId = usersId;
	}*/
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	
}
