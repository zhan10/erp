package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class NewBookingDao extends GenericDaoImpl<NewBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(NewBookingDao.class);
	public NewBookingDao(Class<NewBooking> type) {
		super(type);
	}
}
