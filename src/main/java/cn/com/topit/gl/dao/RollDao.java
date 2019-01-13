package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class RollDao extends GenericDaoImpl<Roll, Long>{
	private static final Logger log=LoggerFactory.getLogger(RollDao.class);
	public RollDao(Class<Roll> type) {
		super(type);
	}
}
