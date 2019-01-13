package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VFloorLockService;
public class VFloorLockAction<VFloorLock> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VFloorLockAction.class);
	private VFloorLockService service;
	public void setService(VFloorLockService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
