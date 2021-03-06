package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class HealthDao extends GenericDaoImpl<Health, Long>{
	private static final Logger log=LoggerFactory.getLogger(HealthDao.class);
	public HealthDao(Class<Health> type) {
		super(type);
	}
}
