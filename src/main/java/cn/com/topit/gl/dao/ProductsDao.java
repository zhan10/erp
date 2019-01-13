package cn.com.topit.gl.dao;

import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;

public class ProductsDao extends GenericDaoImpl<Products, Long> {
	private static final Logger log=LoggerFactory.getLogger(ProductsDao.class);
	public ProductsDao(Class<Products> type) {
		super(type);
	}
	
	
	/**
	 * 批量更新指定字段
	 * 
	 * @param field
	 *            ,fieldValue,ids
	 * 
	 * @return int 更新条数
	 */
	public int updatePrice1(final Double price,final Long ids) throws Exception {
		log.debug("批量更新指定字段 " + type.getClass().getName());
		try {
			Query query = sessionFactory.getCurrentSession().createQuery(
					"update " + tableName + " set price='" + price
							+ "' where genreId in (" + ids + ")");
			return query.executeUpdate();
		} catch (Exception e) {
			log.error("updateFields " + type.getClass().getName()
					+ e.toString());
			e.printStackTrace();
			throw e;
		}
	}
}
