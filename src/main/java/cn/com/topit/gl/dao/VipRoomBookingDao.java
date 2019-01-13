package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VipRoomBookingDao extends GenericDaoImpl<VipRoomBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(VipRoomBookingDao.class);
	public VipRoomBookingDao(Class<VipRoomBooking> type) {
		super(type);
	}
}
