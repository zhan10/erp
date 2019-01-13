package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.WorkbenchLockService;
public class WorkbenchLockAction<WorkbenchLock> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(WorkbenchLockAction.class);
	private WorkbenchLockService service;
	public void setService(WorkbenchLockService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
