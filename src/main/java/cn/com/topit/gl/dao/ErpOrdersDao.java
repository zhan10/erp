package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class ErpOrdersDao extends GenericDaoImpl<ErpOrders, Long>{
	private static final Logger log=LoggerFactory.getLogger(ErpOrdersDao.class);
	public ErpOrdersDao(Class<ErpOrders> type) {
		super(type);
	}
}
