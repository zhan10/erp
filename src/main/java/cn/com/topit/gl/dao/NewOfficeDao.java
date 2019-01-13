package cn.com.topit.gl.dao;
import java.util.List;

import cn.com.topit.base.GenericDao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class NewOfficeDao extends GenericDaoImpl<NewOffice, Long>{
	private static final Logger log=LoggerFactory.getLogger(NewOfficeDao.class);
	public NewOfficeDao(Class<NewOffice> type) {
		super(type);
	}
	// 选择区域下拉框数据
		public List getOfficeComboBox(final String whereSql) {
			log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
			try {System.out.println(whereSql);
				String queryString = "select id,name from " + tableName + " where 1=1 " + whereSql;
				return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
			} catch (Exception e) {
				log.error("getOfficeComboBox 出错：" + e.toString());
				e.printStackTrace();
			}
			return null;
		}
}
