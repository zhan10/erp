package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.MeetingRoomLockService;
public class MeetingRoomLockAction<MeetingRoomLock> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(MeetingRoomLockAction.class);
	private MeetingRoomLockService service;
	public void setService(MeetingRoomLockService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
