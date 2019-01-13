package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class OrdersItemDao extends GenericDaoImpl<OrdersItem, Long>{
	private static final Logger log=LoggerFactory.getLogger(OrdersItemDao.class);
	public OrdersItemDao(Class<OrdersItem> type) {
		super(type);
	}
}
