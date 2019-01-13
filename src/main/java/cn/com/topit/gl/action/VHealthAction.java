package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VHealthService;
public class VHealthAction<VHealth> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VHealthAction.class);
	private VHealthService service;
	public void setService(VHealthService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
