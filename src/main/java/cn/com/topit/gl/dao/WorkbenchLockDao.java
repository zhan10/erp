package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class WorkbenchLockDao extends GenericDaoImpl<WorkbenchLock, Long>{
	private static final Logger log=LoggerFactory.getLogger(WorkbenchLockDao.class);
	public WorkbenchLockDao(Class<WorkbenchLock> type) {
		super(type);
	}
}
