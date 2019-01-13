package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VAreaService;
public class VAreaAction<VArea> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VAreaAction.class);
	private VAreaService service;
	public void setService(VAreaService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
