package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VCustomDao extends GenericDaoImpl<VCustom, Long>{
	private static final Logger log=LoggerFactory.getLogger(VCustomDao.class);
	public VCustomDao(Class<VCustom> type) {
		super(type);
	}
}
