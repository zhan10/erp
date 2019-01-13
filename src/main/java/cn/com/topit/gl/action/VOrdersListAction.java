package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VOrdersListService;
public class VOrdersListAction<VOrdersList> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VOrdersListAction.class);
	private VOrdersListService service;
	public void setService(VOrdersListService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
