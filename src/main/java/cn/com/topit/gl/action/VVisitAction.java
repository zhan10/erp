package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VVisitService;
public class VVisitAction<VVisit> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VVisitAction.class);
	private VVisitService service;
	public void setService(VVisitService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
