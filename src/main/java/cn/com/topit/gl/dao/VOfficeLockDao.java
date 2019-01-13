package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VOfficeLockDao extends GenericDaoImpl<VOfficeLock, Long>{
	private static final Logger log=LoggerFactory.getLogger(VOfficeLockDao.class);
	public VOfficeLockDao(Class<VOfficeLock> type) {
		super(type);
	}
}
