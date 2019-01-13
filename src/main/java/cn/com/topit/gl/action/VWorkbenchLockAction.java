package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VWorkbenchLockService;
public class VWorkbenchLockAction<VWorkbenchLock> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VWorkbenchLockAction.class);
	private VWorkbenchLockService service;
	public void setService(VWorkbenchLockService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
