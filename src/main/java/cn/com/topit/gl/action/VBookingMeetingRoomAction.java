package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VBookingMeetingRoomService;
public class VBookingMeetingRoomAction<VBookingMeetingRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingMeetingRoomAction.class);
	private VBookingMeetingRoomService service;
	public void setService(VBookingMeetingRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
