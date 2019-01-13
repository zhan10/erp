package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VOrdersDao extends GenericDaoImpl<VOrders, Long>{
	private static final Logger log=LoggerFactory.getLogger(VOrdersDao.class);
	public VOrdersDao(Class<VOrders> type) {
		super(type);
	}
}
