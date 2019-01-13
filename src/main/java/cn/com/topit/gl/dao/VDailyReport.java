package cn.com.topit.gl.dao;

import java.util.Date;

import cn.com.topit.base.GenericPojo;

public class VDailyReport implements GenericPojo, java.io.Serializable{
	private Long id;
	private Long consumeAreaId;
	private String consumeAreaName;
	private Long consumerId;
	private String consumerName;
	private Long paymentTypeId;
	private String paymentTypeName;
	private Double consumeRecord;
	private Integer reportYear;
	private Integer reportMonth;
	private Integer reportDay;
	private Date statisticsTime;
	public Long getId() {
		return id;
	}
	public void setId(Long id) {
		this.id = id;
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
	public Long getConsumerId() {
		return consumerId;
	}
	public void setConsumerId(Long consumerId) {
		this.consumerId = consumerId;
	}
	public String getConsumerName() {
		return consumerName;
	}
	public void setConsumerName(String consumerName) {
		this.consumerName = consumerName;
	}
	public Long getPaymentTypeId() {
		return paymentTypeId;
	}
	public void setPaymentTypeId(Long paymentTypeId) {
		this.paymentTypeId = paymentTypeId;
	}
	public String getPaymentTypeName() {
		return paymentTypeName;
	}
	public void setPaymentTypeName(String paymentTypeName) {
		this.paymentTypeName = paymentTypeName;
	}
	public Double getConsumeRecord() {
		return consumeRecord;
	}
	public void setConsumeRecord(Double consumeRecord) {
		this.consumeRecord = consumeRecord;
	}
	
	public Integer getReportYear() {
		return reportYear;
	}
	public void setReportYear(Integer reportYear) {
		this.reportYear = reportYear;
	}
	public Integer getReportMonth() {
		return reportMonth;
	}
	public void setReportMonth(Integer reportMonth) {
		this.reportMonth = reportMonth;
	}
	public Integer getReportDay() {
		return reportDay;
	}
	public void setReportDay(Integer reportDay) {
		this.reportDay = reportDay;
	}
	public Date getStatisticsTime() {
		return statisticsTime;
	}
	public void setStatisticsTime(Date statisticsTime) {
		this.statisticsTime = statisticsTime;
	}
	
}
