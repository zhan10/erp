package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class OfficeLockDao extends GenericDaoImpl<OfficeLock, Long>{
	private static final Logger log=LoggerFactory.getLogger(OfficeLockDao.class);
	public OfficeLockDao(Class<OfficeLock> type) {
		super(type);
	}
}
