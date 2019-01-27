package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.ErpOrdersService;
public class ErpOrdersAction<ErpOrders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ErpOrdersAction.class);
	private ErpOrdersService service;
	public void setService(ErpOrdersService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
