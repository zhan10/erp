package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VBookingOfficeService;
public class VBookingOfficeAction<VBookingOffice> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingOfficeAction.class);
	private VBookingOfficeService service;
	public void setService(VBookingOfficeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
