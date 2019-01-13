package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class InStorePlanDao extends GenericDaoImpl<InStorePlan, Long>{
	private static final Logger log=LoggerFactory.getLogger(InStorePlanDao.class);
	public InStorePlanDao(Class<InStorePlan> type) {
		super(type);
	}
}
