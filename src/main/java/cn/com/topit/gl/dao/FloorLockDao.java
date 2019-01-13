package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class FloorLockDao extends GenericDaoImpl<FloorLock, Long>{
	private static final Logger log=LoggerFactory.getLogger(FloorLockDao.class);
	public FloorLockDao(Class<FloorLock> type) {
		super(type);
	}
}
