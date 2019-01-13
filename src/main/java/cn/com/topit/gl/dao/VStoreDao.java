package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VStoreDao extends GenericDaoImpl<VStore, Long>{
	private static final Logger log=LoggerFactory.getLogger(VStoreDao.class);
	public VStoreDao(Class<VStore> type) {
		super(type);
	}
}
