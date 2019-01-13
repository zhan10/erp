package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VTechCardOrdersService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class VTechCardOrdersAction<VTechCardOrders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VTechCardOrdersAction.class);
	private VTechCardOrdersService service;
	public void setService(VTechCardOrdersService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
