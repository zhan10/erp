package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VOrdersListDao extends GenericDaoImpl<VOrdersList, Long>{
	private static final Logger log=LoggerFactory.getLogger(VOrdersListDao.class);
	public VOrdersListDao(Class<VOrdersList> type) {
		super(type);
	}
}
