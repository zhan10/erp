package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VipRoomBookingService;
public class VipRoomBookingAction<VipRoomBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VipRoomBookingAction.class);
	private VipRoomBookingService service;
	public void setService(VipRoomBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
