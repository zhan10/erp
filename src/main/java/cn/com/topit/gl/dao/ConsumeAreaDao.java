package cn.com.topit.gl.dao;
import java.util.List;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class ConsumeAreaDao extends GenericDaoImpl<ConsumeArea, Long>{
	private static final Logger log=LoggerFactory.getLogger(ConsumeAreaDao.class);
	public ConsumeAreaDao(Class<ConsumeArea> type) {
		super(type);
	}
	// 选择消费类型下拉框数据
		public List getConsumeAreaComboBox(final String whereSql) {
			log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
			try {
				String queryString = "select id,name from " + tableName + " where 1=1 " + whereSql;
				return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
			} catch (Exception e) {
				log.error("getConsumeAreaComboBox 出错：" + e.toString());
				e.printStackTrace();
			}
			return null;
		}
}
