package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class ConsumeTypeDao extends GenericDaoImpl<ConsumeType, Long>{
	private static final Logger log=LoggerFactory.getLogger(ConsumeTypeDao.class);
	public ConsumeTypeDao(Class<ConsumeType> type) {
		super(type);
	}
	// 选择消费类型下拉框数据
		public List getConsumeTypeComboBox(final String whereSql) {
			log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
			try {
				String queryString = "select id,name,price,chargeType from " + tableName + " where 1=1 " + whereSql;
				return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
			} catch (Exception e) {
				log.error("getConsumeTypeComboBox 出错：" + e.toString());
				e.printStackTrace();
			}
			return null;
		}
}
