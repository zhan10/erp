package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VisitServiceService;
public class VisitServiceAction<VisitService> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VisitServiceAction.class);
	private VisitServiceService service;
	public void setService(VisitServiceService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
