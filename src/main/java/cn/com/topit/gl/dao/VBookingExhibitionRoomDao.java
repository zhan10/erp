package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VBookingExhibitionRoomDao extends GenericDaoImpl<VBookingExhibitionRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingExhibitionRoomDao.class);
	public VBookingExhibitionRoomDao(Class<VBookingExhibitionRoom> type) {
		super(type);
	}
}
