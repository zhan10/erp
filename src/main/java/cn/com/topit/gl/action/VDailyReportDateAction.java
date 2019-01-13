package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VDailyReportDateService;
public class VDailyReportDateAction<VDailyReportDate> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VDailyReportDateAction.class);
	private VDailyReportDateService service;
	public void setService(VDailyReportDateService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
