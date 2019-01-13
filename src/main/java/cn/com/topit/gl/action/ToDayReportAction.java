package cn.com.topit.gl.action;
import java.util.Date;
import java.util.Map;

import net.sf.json.JSONObject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.ToDayReportDao;
import cn.com.topit.gl.service.ToDayReportService;
public class ToDayReportAction<ToDayReport> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ToDayReportAction.class);
	private ToDayReportService service;
	public void setService(ToDayReportService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	private Date date;
	public String getToDayReport() {
		try {
			Map map = service.getToDayReport(date,whereSql);
			records.put("sum", map.get("count"));
			records.put("records", map.get("records"));
			//records.put("records",service.getToDayReport(today));
		} catch (Exception e) {
			log.error("getToDayReport出错：" + e.toString());
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
