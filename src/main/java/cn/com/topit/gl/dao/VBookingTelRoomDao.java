package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VBookingTelRoomDao extends GenericDaoImpl<VBookingTelRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingTelRoomDao.class);
	public VBookingTelRoomDao(Class<VBookingTelRoom> type) {
		super(type);
	}
}
