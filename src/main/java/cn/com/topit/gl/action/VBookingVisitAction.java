package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VBookingVisitService;
public class VBookingVisitAction<VOrderVisit> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingVisitAction.class);
	private VBookingVisitService service;
	public void setService(VBookingVisitService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public String manager1() throws Exception {
		return "manager1";
	}
	public String manager2() throws Exception {
		return "manager2";
	}
	public String manager3() throws Exception {
		return "manager3";
	}
	public String manager4() throws Exception {
		return "manager4";
	}
	public String manager5() throws Exception {
		return "manager5";
	}
}
