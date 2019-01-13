package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VDailyReportService;
public class VDailyReportAction<VDailyReport> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VDailyReportAction.class);
	private VDailyReportService service;
	public void setService(VDailyReportService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
