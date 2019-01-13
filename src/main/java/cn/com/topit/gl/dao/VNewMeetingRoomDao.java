package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VNewMeetingRoomDao extends GenericDaoImpl<VNewMeetingRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VNewMeetingRoomDao.class);
	public VNewMeetingRoomDao(Class<VNewMeetingRoom> type) {
		super(type);
	}
}
