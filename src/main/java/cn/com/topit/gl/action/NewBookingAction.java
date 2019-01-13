package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.NewBookingService;
public class NewBookingAction<NewBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(NewBookingAction.class);
	private NewBookingService service;
	public void setService(NewBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
