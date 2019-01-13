package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VCultivateRoomBookingService;
public class VCultivateRoomBookingAction<VCultivateRoomBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VCultivateRoomBookingAction.class);
	private VCultivateRoomBookingService service;
	public void setService(VCultivateRoomBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
