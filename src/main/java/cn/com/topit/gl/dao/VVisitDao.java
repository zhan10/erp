package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VVisitDao extends GenericDaoImpl<VVisit, Long>{
	private static final Logger log=LoggerFactory.getLogger(VVisitDao.class);
	public VVisitDao(Class<VVisit> type) {
		super(type);
	}
}
