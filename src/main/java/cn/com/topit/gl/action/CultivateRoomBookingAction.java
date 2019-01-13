package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.CultivateRoomBookingService;
public class CultivateRoomBookingAction<CultivateRoomBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(CultivateRoomBookingAction.class);
	private CultivateRoomBookingService service;
	public void setService(CultivateRoomBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
