package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class ServeDao extends GenericDaoImpl<Serve, Long>{
	private static final Logger log=LoggerFactory.getLogger(ServeDao.class);
	public ServeDao(Class<Serve> type) {
		super(type);
	}
}
