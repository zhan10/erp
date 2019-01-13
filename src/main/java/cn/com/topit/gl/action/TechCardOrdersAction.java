package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.TechCardOrdersService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class TechCardOrdersAction<TechCardOrders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(TechCardOrdersAction.class);
	private TechCardOrdersService service;
	public void setService(TechCardOrdersService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
