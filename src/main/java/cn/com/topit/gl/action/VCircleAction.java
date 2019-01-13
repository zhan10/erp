package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VCircleService;
public class VCircleAction<VCircle> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VCircleAction.class);
	private VCircleService service;
	public void setService(VCircleService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
