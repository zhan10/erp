package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VBookingVisitDao extends GenericDaoImpl<VBookingVisit, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingVisitDao.class);
	public VBookingVisitDao(Class<VBookingVisit> type) {
		super(type);
	}
}
