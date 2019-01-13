package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.DamageService;
public class DamageAction<Damage> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(DamageAction.class);
	private DamageService service;
	public void setService(DamageService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
