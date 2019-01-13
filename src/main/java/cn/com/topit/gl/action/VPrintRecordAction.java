package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VPrintRecordService;
public class VPrintRecordAction<VPrintRecord> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VPrintRecordAction.class);
	private VPrintRecordService service;
	public void setService(VPrintRecordService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
