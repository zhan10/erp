package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class AreaDao extends GenericDaoImpl<Area, Long>{
	private static final Logger log=LoggerFactory.getLogger(AreaDao.class);
	public AreaDao(Class<Area> type) {
		super(type);
	}
	// 选择区域下拉框数据
			public List getAreasComboBox(final String whereSql) {
				log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
				try {System.out.println(whereSql);
					String queryString = "select id,name from " + tableName + " where 1=1 " + whereSql;
					return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
				} catch (Exception e) {
					log.error("getAreasComboBox 出错：" + e.toString());
					e.printStackTrace();
				}
				return null;
			}
	}

