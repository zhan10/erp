package cn.com.topit.gl.action;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VProductService;
public class VProductAction<VProduct> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VProductAction.class);
	private VProductService service;
	public void setService(VProductService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
