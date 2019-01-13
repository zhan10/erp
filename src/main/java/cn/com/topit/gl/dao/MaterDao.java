package cn.com.topit.gl.dao;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class MaterDao extends GenericDaoImpl<Mater, Long>{
	private static final Logger log=LoggerFactory.getLogger(MaterDao.class);
	public MaterDao(Class<Mater> type) {
		super(type);
	}
	// 选择下拉框数据
		public List getMaterComboBox(final String whereSql) {
			log.info("finding " + type.getClass().getName() + " with whereSql: "
					+ whereSql);
			try {
				String queryString = "select materid as id,matername as name from " + tableName
						+ " where 1=1 " + whereSql;
				return (List) (sessionFactory.getCurrentSession().createQuery(
						queryString).list());
			} catch (Exception e) {
				log.error("getMaterComboBox 出错：" + e.toString());
				e.printStackTrace();
			}
			return null;
		}
}
