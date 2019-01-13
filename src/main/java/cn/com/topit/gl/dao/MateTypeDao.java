package cn.com.topit.gl.dao;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class MateTypeDao extends GenericDaoImpl<MateType, Long>{
	private static final Logger log=LoggerFactory.getLogger(MateTypeDao.class);
	public MateTypeDao(Class<MateType> type) {
		super(type);
	}
	// 选择下拉框数据
		public List getMateTypeComboBox(final String whereSql) {
			log.info("finding " + type.getClass().getName() + " with whereSql: "
					+ whereSql);
			try {
				String queryString = "select matetypeid as id,matertypename as name from " + tableName
						+ " where 1=1 " + whereSql;
				return (List) (sessionFactory.getCurrentSession().createQuery(
						queryString).list());
			} catch (Exception e) {
				log.error("getMateTypeComboBox 出错：" + e.toString());
				e.printStackTrace();
			}
			return null;
		}
}
