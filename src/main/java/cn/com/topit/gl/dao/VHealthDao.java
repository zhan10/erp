package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VHealthDao extends GenericDaoImpl<VHealth, Long>{
	private static final Logger log=LoggerFactory.getLogger(VHealthDao.class);
	public VHealthDao(Class<VHealth> type) {
		super(type);
	}
}
