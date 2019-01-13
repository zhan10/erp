package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VOfficeService;
public class VOfficeAction<VOffice> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VOfficeAction.class);
	private VOfficeService service;
	public void setService(VOfficeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
