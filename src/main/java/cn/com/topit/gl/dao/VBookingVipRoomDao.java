package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VBookingVipRoomDao extends GenericDaoImpl<VBookingVipRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingVipRoomDao.class);
	public VBookingVipRoomDao(Class<VBookingVipRoom> type) {
		super(type);
	}
}
