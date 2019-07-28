package cn.com.topit.gl.dao;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class ErpCabinetDao extends GenericDaoImpl<ErpCabinet, Long>{
	private static final Logger log=LoggerFactory.getLogger(ErpCabinetDao.class);
	public ErpCabinetDao(Class<ErpCabinet> type) {
		super(type);
	}
	// 指定分解员
	public int decompose(String decompose,Long decomposeId,Long ordersId) {
		log.info("finding " + type.getClass().getName());
		try {
			String queryString = "update " + tableName + " set decompose ='" + decompose + "'"+",decompose_id ='"+ decomposeId +"' where orders_id = '" + ordersId + "'";
			System.out.println(queryString);
			Query query = sessionFactory.getCurrentSession().createQuery(queryString);
			return query.executeUpdate();
		} catch (Exception e) {
			log.error("指派分解员出错：" + e.toString());
			e.printStackTrace();
		}
		return 0;
	}
}
