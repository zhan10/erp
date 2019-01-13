package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VFloorService;
public class VFloorAction<VFloor> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VFloorAction.class);
	private VFloorService service;
	public void setService(VFloorService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
