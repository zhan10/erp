package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.OfficeLockService;
public class OfficeLockAction<OfficeLock> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(OfficeLockAction.class);
	private OfficeLockService service;
	public void setService(OfficeLockService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
