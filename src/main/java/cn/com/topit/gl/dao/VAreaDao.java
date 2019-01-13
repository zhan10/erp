package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VAreaDao extends GenericDaoImpl<VArea, Long>{
	private static final Logger log=LoggerFactory.getLogger(VAreaDao.class);
	public VAreaDao(Class<VArea> type) {
		super(type);
	}
}
