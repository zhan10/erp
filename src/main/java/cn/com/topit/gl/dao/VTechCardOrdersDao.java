package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VTechCardOrdersDao extends GenericDaoImpl<VTechCardOrders, Long>{
	private static final Logger log=LoggerFactory.getLogger(VTechCardOrdersDao.class);
	public VTechCardOrdersDao(Class<VTechCardOrders> type) {
		super(type);
	}
}
