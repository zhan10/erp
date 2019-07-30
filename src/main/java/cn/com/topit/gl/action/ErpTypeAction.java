package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.ErpTypeService;
public class ErpTypeAction<ErpType> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ErpTypeAction.class);
	private ErpTypeService service;
	public void setService(ErpTypeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
