package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.RequirementBookingService;
public class RequirementBookingAction<OrderRequest> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(RequirementBookingAction.class);
	private RequirementBookingService service;
	public void setService(RequirementBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public String manager1() throws Exception {
		return "manager1";
	}
	public String manager2() throws Exception {
		return "manager2";
	}
}
