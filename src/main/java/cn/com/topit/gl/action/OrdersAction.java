package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.OrdersService;
public class OrdersAction<Orders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(OrdersAction.class);
	private OrdersService service;
	public void setService(OrdersService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
