package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class ConsumerDao extends GenericDaoImpl<Consumer, Long>{
	private static final Logger log=LoggerFactory.getLogger(ConsumerDao.class);
	public ConsumerDao(Class<Consumer> type) {
		super(type);
	}
	// 选择消费类型下拉框数据
	public List getConsumerComboBox(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
		try {
			String queryString = "select id,name from " + tableName + " where 1=1 " + whereSql;
			return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
		} catch (Exception e) {
			log.error("getConsumerComboBox 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}
