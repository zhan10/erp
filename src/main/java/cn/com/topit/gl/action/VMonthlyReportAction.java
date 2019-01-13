package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VMonthlyReportService;
public class VMonthlyReportAction<VOperatingIncome> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VMonthlyReportAction.class);
	private VMonthlyReportService service;
	public void setService(VMonthlyReportService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
