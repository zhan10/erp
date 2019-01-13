package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.HealthService;
public class HealthAction<Health> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(HealthAction.class);
	private HealthService service;
	public void setService(HealthService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
