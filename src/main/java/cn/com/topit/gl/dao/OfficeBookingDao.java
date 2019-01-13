package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class OfficeBookingDao extends GenericDaoImpl<OfficeBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(OfficeBookingDao.class);
	public OfficeBookingDao(Class<OfficeBooking> type) {
		super(type);
	}
}
