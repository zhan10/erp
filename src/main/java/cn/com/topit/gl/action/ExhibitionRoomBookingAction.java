package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.ExhibitionRoomBookingService;
public class ExhibitionRoomBookingAction<ExhibitionRoomBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ExhibitionRoomBookingAction.class);
	private ExhibitionRoomBookingService service;
	public void setService(ExhibitionRoomBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
