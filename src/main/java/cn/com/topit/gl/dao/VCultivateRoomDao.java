package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VCultivateRoomDao extends GenericDaoImpl<VCultivateRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VCultivateRoomDao.class);
	public VCultivateRoomDao(Class<VCultivateRoom> type) {
		super(type);
	}
}
