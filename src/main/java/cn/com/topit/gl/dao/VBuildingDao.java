package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VBuildingDao extends GenericDaoImpl<VBuilding, Long>{
	private static final Logger log=LoggerFactory.getLogger(VBuildingDao.class);
	public VBuildingDao(Class<VBuilding> type) {
		super(type);
	}
}
