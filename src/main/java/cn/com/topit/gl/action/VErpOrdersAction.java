package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VErpOrdersService;
public class VErpOrdersAction<VErpOrders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VErpOrdersAction.class);
	private VErpOrdersService service;
	public void setService(VErpOrdersService service) {
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
