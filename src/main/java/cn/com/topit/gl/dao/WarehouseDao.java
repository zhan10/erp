package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class WarehouseDao extends GenericDaoImpl<Warehouse, Long>{
	private static final Logger log=LoggerFactory.getLogger(WarehouseDao.class);
	public WarehouseDao(Class<Warehouse> type) {
		super(type);
	}
	// 选择仓库下拉框数据
	public List getWarehouseComboBox(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
		try {
			String queryString = "select id,name from " + tableName + " where 1=1 " + whereSql;
			return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
		} catch (Exception e) {
			log.error("getWarehouseComboBox 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}
