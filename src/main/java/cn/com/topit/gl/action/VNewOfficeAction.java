package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VNewOfficeService;
public class VNewOfficeAction<VNewOffice> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VNewOfficeAction.class);
	private VNewOfficeService service;
	public void setService(VNewOfficeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
