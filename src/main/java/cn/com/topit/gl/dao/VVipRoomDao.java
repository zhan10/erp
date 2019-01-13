package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VVipRoomDao extends GenericDaoImpl<VVipRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VVipRoomDao.class);
	public VVipRoomDao(Class<VVipRoom> type) {
		super(type);
	}
}
