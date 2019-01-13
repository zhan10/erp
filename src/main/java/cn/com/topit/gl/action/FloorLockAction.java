package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.FloorLockService;
public class FloorLockAction<FloorLock> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(FloorLockAction.class);
	private FloorLockService service;
	public void setService(FloorLockService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
