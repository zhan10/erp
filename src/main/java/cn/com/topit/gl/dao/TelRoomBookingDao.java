package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class TelRoomBookingDao extends GenericDaoImpl<TelRoomBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(TelRoomBookingDao.class);
	public TelRoomBookingDao(Class<TelRoomBooking> type) {
		super(type);
	}
}
