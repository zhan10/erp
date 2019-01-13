package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VBookingTelRoomService;
public class VBookingTelRoomAction<VBookingTelRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingTelRoomAction.class);
	private VBookingTelRoomService service;
	public void setService(VBookingTelRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
