package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VBookingMeetingRoomDao extends GenericDaoImpl<VBookingMeetingRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingMeetingRoomDao.class);
	public VBookingMeetingRoomDao(Class<VBookingMeetingRoom> type) {
		super(type);
	}
}
