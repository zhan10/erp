package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class StoreDao extends GenericDaoImpl<Store, Long>{
	private static final Logger log=LoggerFactory.getLogger(StoreDao.class);
	public StoreDao(Class<Store> type) {
		super(type);
	}
}
