package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.InStorePlanService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class InStorePlanAction<InStorePlan> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(InStorePlanAction.class);
	private InStorePlanService service;
	public void setService(InStorePlanService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
