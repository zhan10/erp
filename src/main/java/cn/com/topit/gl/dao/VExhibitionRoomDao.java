package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VExhibitionRoomDao extends GenericDaoImpl<VExhibitionRoom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VExhibitionRoomDao.class);
	public VExhibitionRoomDao(Class<VExhibitionRoom> type) {
		super(type);
	}
}
