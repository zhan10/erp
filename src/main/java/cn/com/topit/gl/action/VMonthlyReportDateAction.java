package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VMonthlyReportDateService;
public class VMonthlyReportDateAction<VMonthlyReportDate> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VMonthlyReportDateAction.class);
	private VMonthlyReportDateService service;
	public void setService(VMonthlyReportDateService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
