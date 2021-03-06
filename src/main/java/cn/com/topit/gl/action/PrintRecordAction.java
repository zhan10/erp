package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.PrintRecordService;
public class PrintRecordAction<PrintRecord> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(PrintRecordAction.class);
	private PrintRecordService service;
	public void setService(PrintRecordService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
