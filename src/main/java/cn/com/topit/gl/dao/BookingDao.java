package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class BookingDao extends GenericDaoImpl<Booking, Long>{
	private static final Logger log=LoggerFactory.getLogger(BookingDao.class);
	public BookingDao(Class<Booking> type) {
		super(type);
	}
	
	// 选择订单下拉框数据
	public List getBookingComboBox(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
		try {
			String queryString = "select id,code,consumerId from " + tableName + " where 1=1 " + whereSql;
			return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
		} catch (Exception e) {
			log.error("getBookingComboBox 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}
