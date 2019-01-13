package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VisitServiceDao extends GenericDaoImpl<VisitService, Long>{
	private static final Logger log=LoggerFactory.getLogger(VisitServiceDao.class);
	public VisitServiceDao(Class<VisitService> type) {
		super(type);
	}
}
