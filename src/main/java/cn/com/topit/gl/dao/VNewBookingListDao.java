package cn.com.topit.gl.dao;
import java.util.List;

import cn.com.topit.base.GenericDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VNewBookingListDao extends GenericDaoImpl<VNewBookingList, Long>{
	private static final Logger log=LoggerFactory.getLogger(VNewBookingListDao.class);
	public VNewBookingListDao(Class<VNewBookingList> type) {
		super(type);
	}
	public List getProductBooking(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
		try {System.out.println(whereSql);
			String queryString = "from " + tableName + " where 1=1 " + whereSql;
			return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
		} catch (Exception e) {
			log.error("getProductBooking 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}
