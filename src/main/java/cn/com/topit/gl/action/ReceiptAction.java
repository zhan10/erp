package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.ReceiptService;
import cn.com.topit.gl.service.VDailyReportService;
public class ReceiptAction<Receipt> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ReceiptAction.class);
	private ReceiptService service;
	public void setService(ReceiptService service) {
		this.service = service;
		super.setAbstractService(service);	}
}
