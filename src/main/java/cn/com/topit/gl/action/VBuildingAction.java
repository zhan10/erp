package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VBuildingService;
public class VBuildingAction<VBuilding> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBuildingAction.class);
	private VBuildingService service;
	public void setService(VBuildingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
