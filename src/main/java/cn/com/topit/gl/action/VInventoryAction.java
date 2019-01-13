package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.VInventory;
import cn.com.topit.gl.service.VInventoryService;


public class VInventoryAction extends GenericActionSupport<VInventory> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VInventoryAction.class);
	private VInventoryService service;

	public void setService(VInventoryService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	public String manager1() throws Exception {
		return "manager1";
	}
}
