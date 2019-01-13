package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VFloorLockDao extends GenericDaoImpl<VFloorLock, Long>{
	private static final Logger log=LoggerFactory.getLogger(VFloorLockDao.class);
	public VFloorLockDao(Class<VFloorLock> type) {
		super(type);
	}
}
