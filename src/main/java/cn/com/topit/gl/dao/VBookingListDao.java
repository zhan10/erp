package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VBookingListDao extends GenericDaoImpl<VBookingList, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBookingListDao.class);
	public VBookingListDao(Class<VBookingList> type) {
		super(type);
	}
}
