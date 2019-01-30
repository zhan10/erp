package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.ErpCabinetService;
public class ErpCabinetAction<ErpCabinet> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ErpCabinetAction.class);
	private ErpCabinetService service;
	public void setService(ErpCabinetService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
