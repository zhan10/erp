package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VNewMeetingRoomService;
public class VNewMeetingRoomAction<VNewMeetingRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VNewMeetingRoomAction.class);
	private VNewMeetingRoomService service;
	public void setService(VNewMeetingRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
