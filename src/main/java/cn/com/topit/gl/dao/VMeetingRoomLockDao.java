package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VMeetingRoomLockDao extends GenericDaoImpl<VMeetingRoomLock, Long>{
	private static final Logger log=LoggerFactory.getLogger(VMeetingRoomLockDao.class);
	public VMeetingRoomLockDao(Class<VMeetingRoomLock> type) {
		super(type);
	}
}
