package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VFloorDao extends GenericDaoImpl<VFloor, Long>{
	private static final Logger log=LoggerFactory.getLogger(VFloorDao.class);
	public VFloorDao(Class<VFloor> type) {
		super(type);
	}
}
