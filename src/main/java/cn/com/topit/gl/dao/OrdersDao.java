package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class OrdersDao extends GenericDaoImpl<Orders, Long>{
	private static final Logger log=LoggerFactory.getLogger(OrdersDao.class);
	public OrdersDao(Class<Orders> type) {
		super(type);
	}
}
