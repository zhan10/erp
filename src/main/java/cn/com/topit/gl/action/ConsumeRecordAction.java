package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.ConsumeRecordService;
public class ConsumeRecordAction<ConsumeRecord> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ConsumeRecordAction.class);
	private ConsumeRecordService service;
	public void setService(ConsumeRecordService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
