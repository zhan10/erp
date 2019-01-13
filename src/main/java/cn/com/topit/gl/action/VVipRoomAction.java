package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VVipRoomService;
public class VVipRoomAction<VVipRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VVipRoomAction.class);
	private VVipRoomService service;
	public void setService(VVipRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
