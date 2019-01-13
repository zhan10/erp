package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class PackDao extends GenericDaoImpl<Pack, Long>{
	private static final Logger log=LoggerFactory.getLogger(PackDao.class);
	public PackDao(Class<Pack> type) {
		super(type);
	}
}
