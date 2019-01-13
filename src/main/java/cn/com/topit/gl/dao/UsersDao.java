package cn.com.topit.gl.dao;
import java.util.List;

import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class UsersDao extends GenericDaoImpl<Users, Long> {
	private static final Logger log = LoggerFactory.getLogger(UsersDao.class);
	public UsersDao(Class<Users> type) {
		super(type);
	}
	// 选择用户下拉框数据
	public List getUsersComboBox(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);

		try {
			String queryString = "select code,name from " + tableName + " where 1=1 " + whereSql;
			return (List)(sessionFactory.getCurrentSession().createQuery(queryString).list());
		} catch (Exception e) {
			log.error("getUsersComboBox 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
	// 取用户名、工号列表
		public List getUsersNameCode(final String whereSql,final int page,final int limit) {
			log.info("finding " + type.getClass().getName() + " with whereSql: " + whereSql);
			try {
				String hql = "select id,name,code from " + tableName + " where 1=1 " + whereSql;
				Query query = sessionFactory.getCurrentSession().createQuery(hql);
				query.setFirstResult(((page < 1 ? 1 : page) - 1)
						* (limit < 1 ? 20 : limit));
				query.setMaxResults(limit < 1 ? 20 : limit);
				return query.list();
			} catch (Exception e) {
				log.error("getUsersNameCode 出错：" + e.toString());
				e.printStackTrace();
			}
			return null;
		}
	
}
