package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.gl.service.ServeService;
public class ServeAction<Serve> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ServeAction.class);
	private ServeService service;
	public void setService(ServeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public String manager1() throws Exception {
		return "manager1";
	}
	public String manager2() throws Exception {
		return "manager2";
	}
	public String manager3() throws Exception {
		return "manager3";
	}
	public String manager4() throws Exception {
		return "manager4";
	}
}
