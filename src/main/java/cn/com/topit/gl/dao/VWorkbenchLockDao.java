package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VWorkbenchLockDao extends GenericDaoImpl<VWorkbenchLock, Long>{
	private static final Logger log=LoggerFactory.getLogger(VWorkbenchLockDao.class);
	public VWorkbenchLockDao(Class<VWorkbenchLock> type) {
		super(type);
	}
}
