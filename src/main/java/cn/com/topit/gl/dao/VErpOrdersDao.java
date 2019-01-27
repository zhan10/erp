package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VErpOrdersDao extends GenericDaoImpl<VErpOrders, Long>{
	private static final Logger log=LoggerFactory.getLogger(VErpOrdersDao.class);
	public VErpOrdersDao(Class<VErpOrders> type) {
		super(type);
	}
}
