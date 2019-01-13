package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.StoreService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class StoreAction<Store> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(StoreAction.class);
	private StoreService service;
	public void setService(StoreService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
