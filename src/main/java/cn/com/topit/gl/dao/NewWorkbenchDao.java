package cn.com.topit.gl.dao;
import java.util.List;

import cn.com.topit.base.GenericDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class NewWorkbenchDao extends GenericDaoImpl<NewWorkbench, Long>{
	private static final Logger log=LoggerFactory.getLogger(NewWorkbenchDao.class);
	public NewWorkbenchDao(Class<NewWorkbench> type) {
		super(type);
	}
	// 选择区域下拉框数据
	public List getWorkbenchComboBox(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
		try {System.out.println(whereSql);
			String queryString = "select id,name from " + tableName + " where 1=1 " + whereSql;
			return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
		} catch (Exception e) {
			log.error("getWorkbenchComboBox 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
	public boolean findByFloorId(final String floorId) {
		try {
			String queryString = "select id from " + tableName + " where floor_id= "+floorId;
			List list = sessionFactory.getCurrentSession().createQuery(queryString).list();
			if(list.isEmpty()){
				return false;
			}
			return true;
		} catch (Exception e) {
			log.error("getAreasComboBox 出错：" + e.toString());
			e.printStackTrace();
		}
		return false;
	}
}
