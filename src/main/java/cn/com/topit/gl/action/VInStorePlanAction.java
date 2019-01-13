package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VInStorePlanService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class VInStorePlanAction<VInStorePlan> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VInStorePlanAction.class);
	private VInStorePlanService service;
	public void setService(VInStorePlanService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
