package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class TechCardOrdersDao extends GenericDaoImpl<TechCardOrders, Long>{
	private static final Logger log=LoggerFactory.getLogger(TechCardOrdersDao.class);
	public TechCardOrdersDao(Class<TechCardOrders> type) {
		super(type);
	}
}
