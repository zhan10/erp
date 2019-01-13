package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VBookingOfficeDao extends GenericDaoImpl<VBookingOffice, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingOfficeDao.class);
	public VBookingOfficeDao(Class<VBookingOffice> type) {
		super(type);
	}
}
