package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class MeetingRoomLockDao extends GenericDaoImpl<MeetingRoomLock, Long>{
	private static final Logger log=LoggerFactory.getLogger(MeetingRoomLockDao.class);
	public MeetingRoomLockDao(Class<MeetingRoomLock> type) {
		super(type);
	}
}
