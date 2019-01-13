package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VDamageService;
public class VDamageAction<VDamage> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VDamageAction.class);
	private VDamageService service;
	public void setService(VDamageService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
