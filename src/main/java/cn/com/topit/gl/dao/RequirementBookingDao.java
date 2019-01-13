package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class RequirementBookingDao extends GenericDaoImpl<RequirementBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(RequirementBookingDao.class);
	public RequirementBookingDao(Class<RequirementBooking> type) {
		super(type);
	}
}
