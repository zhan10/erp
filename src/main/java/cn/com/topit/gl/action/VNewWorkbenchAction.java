package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VNewWorkbenchService;
public class VNewWorkbenchAction<VNewWorkbench> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VNewWorkbenchAction.class);
	private VNewWorkbenchService service;
	public void setService(VNewWorkbenchService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
