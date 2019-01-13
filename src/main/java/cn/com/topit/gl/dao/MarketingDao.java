package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class MarketingDao extends GenericDaoImpl<Marketing, Long>{
	private static final Logger log=LoggerFactory.getLogger(MarketingDao.class);
	public MarketingDao(Class<Marketing> type) {
		super(type);
	}
	
	// 选择订单下拉框数据
	public List getMarketingComboBox(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
		try {
			String queryString = "select id,code,consumerId from " + tableName + " where 1=1 " + whereSql;
			return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
		} catch (Exception e) {
			log.error("getMarketingComboBox 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}
