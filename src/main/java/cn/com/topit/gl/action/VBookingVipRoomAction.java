package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VBookingVipRoomService;
public class VBookingVipRoomAction<VBookingVipRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingVipRoomAction.class);
	private VBookingVipRoomService service;
	public void setService(VBookingVipRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
