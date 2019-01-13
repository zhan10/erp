package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.WorkbenchBookingService;
public class WorkbenchBookingAction<WorkbenchBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(WorkbenchBookingAction.class);
	private WorkbenchBookingService service;
	public void setService(WorkbenchBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
