package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class OrdersListDao extends GenericDaoImpl<OrdersList, Long>{
	private static final Logger log=LoggerFactory.getLogger(OrdersListDao.class);
	public OrdersListDao(Class<OrdersList> type) {
		super(type);
	}
}
