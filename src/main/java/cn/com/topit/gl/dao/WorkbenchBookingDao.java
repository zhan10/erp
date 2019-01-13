package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class WorkbenchBookingDao extends GenericDaoImpl<WorkbenchBooking, Long>{
	private static final Logger log=LoggerFactory.getLogger(WorkbenchBookingDao.class);
	public WorkbenchBookingDao(Class<WorkbenchBooking> type) {
		super(type);
	}
}
