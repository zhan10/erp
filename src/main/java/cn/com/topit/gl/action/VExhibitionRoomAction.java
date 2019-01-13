package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VExhibitionRoomService;
public class VExhibitionRoomAction<VExhibitionRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VExhibitionRoomAction.class);
	private VExhibitionRoomService service;
	public void setService(VExhibitionRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
