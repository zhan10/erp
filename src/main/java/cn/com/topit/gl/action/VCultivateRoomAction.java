package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VCultivateRoomService;
public class VCultivateRoomAction<VCultivateRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VCultivateRoomAction.class);
	private VCultivateRoomService service;
	public void setService(VCultivateRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
