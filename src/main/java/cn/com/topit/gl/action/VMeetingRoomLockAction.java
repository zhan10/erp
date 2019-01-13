package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VMeetingRoomLockService;
public class VMeetingRoomLockAction<VMeetingRoomLock> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VMeetingRoomLockAction.class);
	private VMeetingRoomLockService service;
	public void setService(VMeetingRoomLockService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
