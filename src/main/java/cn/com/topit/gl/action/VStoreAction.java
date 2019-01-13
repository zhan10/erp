package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VStoreService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class VStoreAction<VStore> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VStoreAction.class);
	private VStoreService service;
	public void setService(VStoreService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
