package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.gl.service.VBookingListService;
public class VBookingListAction<VBookingList> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingListAction.class);
	private VBookingListService service;
	public void setService(VBookingListService service) {
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
