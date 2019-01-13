package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VMeetingRoomDao extends GenericDaoImpl<VMeetingRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VMeetingRoomDao.class);
	public VMeetingRoomDao(Class<VMeetingRoom> type) {
		super(type);
	}
}
