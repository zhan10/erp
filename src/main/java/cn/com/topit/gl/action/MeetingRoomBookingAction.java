package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.MeetingRoomBookingService;
public class MeetingRoomBookingAction<MeetingRoomBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(MeetingRoomBookingAction.class);
	private MeetingRoomBookingService service;
	public void setService(MeetingRoomBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
