package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.RollService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class RollAction<Roll> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(RollAction.class);
	private RollService service;
	public void setService(RollService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
