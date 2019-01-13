package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VCustomService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class VCustomAction<VCustom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VCustomAction.class);
	private VCustomService service;
	public void setService(VCustomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
