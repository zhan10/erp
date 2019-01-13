package cn.com.topit.gl.action;
import java.util.Date;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.TheMonthReportService;
public class TheMonthReportAction<TheMonthReport> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(TheMonthReportAction.class);
	private TheMonthReportService service;
	public void setService(TheMonthReportService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	private Date date;
	public String getTheMonthReport() {
		try {
			Map map = service.getTheMonthReport(date,whereSql);
			records.put("sum", map.get("count"));
			records.put("records", map.get("records"));
			//records.put("records",service.getToDayReport(today));
		} catch (Exception e) {
			log.error("getTheMonthReport出错：" + e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	
}
