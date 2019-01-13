package cn.com.topit.base;

import java.io.Serializable;
import java.sql.SQLException;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.hibernate.FlushMode;
import org.hibernate.Query;
import org.hibernate.SessionFactory;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Hibernate implementation of GenericDao A typesafe implementation of CRUD and
 * finder methods based on Hibernate and Spring AOP The finders are implemented
 * through the executeFinder method. Normally called by the
 * FinderIntroductionInterceptor
 */
public class GenericDaoImpl<T, PK extends Serializable> implements
		GenericDao<T, PK> {
	protected SessionFactory sessionFactory;
	protected String tableName;
	protected Class<T> type;
	protected static final Logger log = LoggerFactory
			.getLogger(GenericDaoImpl.class);

	public GenericDaoImpl(Class<T> type) {
		this.type = type;
		this.tableName = type.getSimpleName();
	}

	/**
	 * 保存实例，并返回原实例
	 * 
	 * @param T
	 *            ob 范型
	 * @return T 范型
	 */
	public T save(T ob) throws Exception {
		log.info("saving " + ob.getClass().getName());	
		sessionFactory.getCurrentSession().setFlushMode(FlushMode.COMMIT);
		try{
			checkData(ob);			
		}catch(Exception e){			
			throw e;
		}
		try {
			ob = (T) (sessionFactory.getCurrentSession().merge(ob));
			log.debug("save " + ob.getClass().getName() + " successful!");
			return ob;
		} catch (Exception e) {			
			log.error("save " + ob.getClass().getName() + " failed"
					+ e.toString());
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * 根据主键查询实例，并返回原实例
	 * 
	 * @param T
	 *            ob 范型
	 * @return T 范型
	 */
	public T findById(PK id) {
		return (T) sessionFactory.getCurrentSession().get(type, id);
	}

	/**
	 * 删除实例
	 * 
	 * @param T
	 *            范型
	 * @return void
	 */
	public void delete(T o) throws Exception {
		try {
			sessionFactory.getCurrentSession().delete(o);
		} catch (Exception e) {
			log.error("delete " + type.getClass().getName() + " 出错："
					+ e.toString());
			e.printStackTrace();
			throw e;
		}
	}

	/**
	 * 根据多个id拼接字符串（以逗号分隔，如1,3,5,8,11...），删除对应的实例
	 * 
	 * @param String
	 *            多id连接字符串
	 * @return int 删除条数
	 */
	public int deleteByIds(final String ids) throws Exception {
		log.info("deleting " + type.getClass().getName() + " by string");
		try {
			String hql = "delete from  " + tableName + "  where id in " + "("
					+ ids + ")";
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			return query.executeUpdate();
		} catch (Exception e) {
			log.error("delete " + type.getClass().getName() + " by ids 出错："
					+ e.toString());
			e.printStackTrace();
			throw e;
		}
	}
	public int deleteBySql(String sql) throws Exception{
		log.info("deleting " + type.getClass().getName() + " by string");
		try {
			String hql = "delete from  " + tableName + "  where 1=1 " + sql;
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			return query.executeUpdate();
		} catch (Exception e) {
			log.error("delete " + type.getClass().getName() + " by sql 出错："
					+ e.toString());
			e.printStackTrace();
			throw e;
		}
	}
	public int deleteByIds(final PK[] ids) throws Exception {
		log.info("deleting " + type.getClass().getName() + " by PK[]");
		StringBuffer deleteIds = new StringBuffer();
		for (PK pk : ids)
			deleteIds.append(pk.toString()).append(',');
		deleteIds = deleteIds.deleteCharAt(deleteIds.length());
		return deleteByIds(deleteIds.toString());
	}

	public List<T> findBySql(final String whereSql) {
		log.info("finding " + type.getClass().getName() + " with whereSql: "
				+ whereSql);

		try {
			String queryString = "from " + tableName + " where 1=1 " + whereSql;
			return (List<T>) (sessionFactory.getCurrentSession().createQuery(
					queryString).list());
		} catch (Exception e) {
			log.error("finding " + type.getClass().getName() + " failed",
					e.toString());
			e.printStackTrace();
		}
		return null;
	}

	public List<T> findBySql(final String whereSql, final int page,
			final int pageSize) {
		log.info("finding  " + type.getClass().getName()
				+ "  instance with whereSql: " + whereSql + ",page:" + page
				+ ",pageSize" + pageSize);
		try {
			String hql = "from  " + tableName + "  where 1=1 " + whereSql;
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			query.setFirstResult(((page < 1 ? 1 : page) - 1)
					* (pageSize < 1 ? 20 : pageSize));
			query.setMaxResults(pageSize < 1 ? 20 : pageSize);
			long t1 = System.currentTimeMillis();
			List list = query.list();
			long t2 = System.currentTimeMillis();
			log.debug("findBySql时间：" + (t2 - t1));
			return list;

		} catch (Exception e) {
			log.error("findBySql " + type.getClass().getName() + " failed",
					e.toString());
			e.printStackTrace();
		}
		return null;
	}

	public int getRowsCount(final String whereSql) {
		log.debug("get count of   " + type.getClass().getName()
				+ "  with whereSql: " + whereSql);
		try {
			String hql = "select count(*) from " + tableName + " where 1=1 "
					+ whereSql;			
			Query query = sessionFactory.getCurrentSession().createQuery(hql);
			Integer count = ((Long) query.iterate().next()).intValue();
			log.debug("count:" + count);
			return count.intValue();
		} catch (Throwable e) {
			log.error("get count failed", e);
			e.printStackTrace();
		}
		return 0;
	}

	/**
	 * 批量更新指定字段
	 * 
	 * @param field
	 *            ,fieldValue,ids
	 * 
	 * @return int 更新条数
	 */
	public int updateFields(final String field, final String fieldValue,
			final String ids) throws Exception {
		log.debug("批量更新指定字段 " + type.getClass().getName());
		try {
			Query query = sessionFactory.getCurrentSession().createQuery(
					"update " + tableName + " set " + field + "='" + fieldValue
							+ "' where id in (" + ids + ")");
			return query.executeUpdate();
		} catch (Exception e) {
			log.error("updateFields " + type.getClass().getName()
					+ e.toString());
			e.printStackTrace();
			throw e;
		}
	}

	// 若tableName为空说明未注入，则直接同构造函数GenericDaoImpl(Class<T> type)
	// 生成tableName,策略为类名＝表名
	public void setTableName(final String tableName) {
		this.tableName = tableName;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	// 将大写字母转为下划线小写
	protected String camel(String param) {
		Pattern p = Pattern.compile("[A-Z]");
		if (param == null || param.equals(""))
			return "";
		StringBuilder builder = new StringBuilder(param);
		Matcher mc = p.matcher(param);
		int i = 0;
		while (mc.find()) {
			builder.replace(mc.start() + i, mc.end() + i, "_"
					+ mc.group().toLowerCase());
			i++;
		}
		if ('_' == builder.charAt(0)) {
			builder.deleteCharAt(0);
		}
		return builder.toString();
	}
//检查数据合法性，如unique、长度等
	protected void checkData(Object obj) throws Exception{
	
	}
	//清session缓存
	public void clear(){
		sessionFactory.getCurrentSession().clear();
	}
}
