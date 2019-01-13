package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class CultivateRoomBookingDao extends GenericDaoImpl<CultivateRoomBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(CultivateRoomBookingDao.class);
	public CultivateRoomBookingDao(Class<CultivateRoomBooking> type) {
		super(type);
	}
}
