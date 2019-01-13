package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class MeetingRoomBookingDao extends GenericDaoImpl<MeetingRoomBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(MeetingRoomBookingDao.class);
	public MeetingRoomBookingDao(Class<MeetingRoomBooking> type) {
		super(type);
	}
}
