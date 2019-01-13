package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VTelRoomDao extends GenericDaoImpl<VTelRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VTelRoomDao.class);
	public VTelRoomDao(Class<VTelRoom> type) {
		super(type);
	}
}
