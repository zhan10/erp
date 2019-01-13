package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VOrdersService;
public class VOrdersAction<VOrders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VOrdersAction.class);
	private VOrdersService service;
	public void setService(VOrdersService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
