package cn.com.topit.gl.dao;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class InventoryDao extends GenericDaoImpl<Inventory, Long>{
	private static final Logger log=LoggerFactory.getLogger(InventoryDao.class);
	public InventoryDao(Class<Inventory> type) {
		super(type);
	}
	public Object getResult(final String materid) {
		log.info("finding " + type.getClass().getName());
		try {
			String queryString = "select s.materid,(s.qty-s.qty2)as qty_result from "
					+ "(select t.*, ISNULL(t1.qty, 0) as qty2 from "
					+ "(SELECT a.materid, sum(a.quantities) as qty from inventory a  where a.type=1 GROUP BY a.materid) t "
					+ "LEFT JOIN "
					+ "(SELECT a.materid, sum(a.quantities) as qty from inventory a  where a.type=2 GROUP BY a.materid) t1 "
					+ "on t.materid=t1.materid)s WHERE materid="+materid;
			return sessionFactory.getCurrentSession().createSQLQuery(queryString).list().get(0);
		} catch (Exception e) {
			log.error("getResult 出错：" + e.toString());
			e.printStackTrace();
		}
		return null;
	}
}
