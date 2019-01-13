package cn.com.topit.gl.dao;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import net.sf.json.JSONArray;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class ToDayReportDao extends GenericDaoImpl<ToDayReport, Long>{
	private static final Logger log=LoggerFactory.getLogger(ToDayReportDao.class);
	public ToDayReportDao(Class<ToDayReport> type) {
		super(type);
	}
	public List<ToDayReport> getToDayReport(final Date date,String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: "
				+ whereSql);
		try {
			Query query = sessionFactory.getCurrentSession().getNamedQuery("sp_day");
			/*DateFormat format1 = new SimpleDateFormat("yyyy-MM-dd");
			Date date = format1.parse("2016-3-18");  */  
			query.setDate(0, date);
			List list = query.list();
			return list;
		} catch (Exception e) {
			log.error("getToDayReport 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	} 
}
