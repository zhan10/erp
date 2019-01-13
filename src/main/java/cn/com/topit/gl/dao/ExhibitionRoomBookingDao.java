package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class ExhibitionRoomBookingDao extends GenericDaoImpl<ExhibitionRoomBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(ExhibitionRoomBookingDao.class);
	public ExhibitionRoomBookingDao(Class<ExhibitionRoomBooking> type) {
		super(type);
	}
}
