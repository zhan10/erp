package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VCircleDao extends GenericDaoImpl<VCircle, Long>{
	private static final Logger log=LoggerFactory.getLogger(VCircleDao.class);
	public VCircleDao(Class<VCircle> type) {
		super(type);
	}
}
