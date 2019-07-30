package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.ErpMetalsService;
public class ErpMetalsAction<ErpMetals> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ErpMetalsAction.class);
	private ErpMetalsService service;
	public void setService(ErpMetalsService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
