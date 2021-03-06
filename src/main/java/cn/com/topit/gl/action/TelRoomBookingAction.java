package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.TelRoomBookingService;
public class TelRoomBookingAction<TelRoomBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(TelRoomBookingAction.class);
	private TelRoomBookingService service;
	public void setService(TelRoomBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
