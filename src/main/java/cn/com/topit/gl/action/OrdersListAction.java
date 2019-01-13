package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.OrdersListService;
public class OrdersListAction<OrdersList> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(OrdersListAction.class);
	private OrdersListService service;
	public void setService(OrdersListService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
