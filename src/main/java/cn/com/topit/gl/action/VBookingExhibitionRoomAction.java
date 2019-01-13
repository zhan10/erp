package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VBookingExhibitionRoomService;
public class VBookingExhibitionRoomAction<VBookingExhibitionRoom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingExhibitionRoomAction.class);
	private VBookingExhibitionRoomService service;
	public void setService(VBookingExhibitionRoomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
