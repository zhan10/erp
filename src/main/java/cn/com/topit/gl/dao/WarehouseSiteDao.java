package cn.com.topit.gl.dao;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class WarehouseSiteDao extends GenericDaoImpl<WarehouseSite, Long>{
	private static final Logger log=LoggerFactory.getLogger(WarehouseSiteDao.class);
	public WarehouseSiteDao(Class<WarehouseSite> type) {
		super(type);
	}
	// 选择仓库下拉框数据
	public List getWarehouseSiteComboBox(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
		try {
			String queryString = "select id,name from " + tableName + " where 1=1 " + whereSql;
			return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
		} catch (Exception e) {
			log.error("getWarehouseSiteComboBox 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}
