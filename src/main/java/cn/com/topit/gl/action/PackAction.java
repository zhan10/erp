package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.PackService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class PackAction<Pack> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(PackAction.class);
	private PackService service;
	public void setService(PackService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
