package cn.com.topit.gl.dao;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class TheMonthReportDao extends GenericDaoImpl<TheMonthReport, Long>{
	private static final Logger log=LoggerFactory.getLogger(TheMonthReportDao.class);
	public TheMonthReportDao(Class<TheMonthReport> type) {
		super(type);
	}
	public List<TheMonthReport> getTheMonthReport(final Date date,String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: "
				+ whereSql);
		try {
			Query query = sessionFactory.getCurrentSession().getNamedQuery("sp_month");
			/*DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date = format1.parse("2016-3-18");  */  
			query.setDate(0, date);
			List list = query.list();
			return list;
		} catch (Exception e) {
			log.error("getTheMonthReport 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	} 
}
