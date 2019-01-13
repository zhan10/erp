package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class CustomDao extends GenericDaoImpl<Custom, Long>{
	private static final Logger log=LoggerFactory.getLogger(CustomDao.class);
	public CustomDao(Class<Custom> type) {
		super(type);
	}
	// 选择客户下拉框数据
		public List getCustomComboBox(final String whereSql) {
			log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);

			try {
				String queryString = "select id,code,shortName from " + tableName + " where 1=1 " + whereSql;
				return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
			} catch (Exception e) {
				log.error("getCustomComboBox 出错：" + e.toString());
				e.printStackTrace();
			}
			return null;
		}
}
