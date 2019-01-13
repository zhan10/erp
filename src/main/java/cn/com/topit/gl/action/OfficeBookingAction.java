package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.OfficeBookingService;
public class OfficeBookingAction<OfficeBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(OfficeBookingAction.class);
	private OfficeBookingService service;
	public void setService(OfficeBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
