package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VTelRoomService;
public class VTelRoomAction<VTelRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VTelRoomAction.class);
	private VTelRoomService service;
	public void setService(VTelRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
