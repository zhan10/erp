package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class OfficeTypeDao extends GenericDaoImpl<OfficeType, Long>{
	private static final Logger log=LoggerFactory.getLogger(OfficeTypeDao.class);
	public OfficeTypeDao(Class<OfficeType> type) {
		super(type);
	}
	// 选择下拉框数据
				public List getOfficeTypesComboBox(final String whereSql) {
					log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
					try {
						String queryString = "select id,name,price,unit from " + tableName + " where 1=1 " + whereSql;
						return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
					} catch (Exception e) {
						log.error("getOfficeTypesComboBox 出错：" + e.toString());
						e.printStackTrace();
					}
					return null;
				}
}
