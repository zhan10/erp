package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VNewWorkbenchDao extends GenericDaoImpl<VNewWorkbench, Long>{
	private static final Logger log=LoggerFactory.getLogger(VNewWorkbenchDao.class);
	public VNewWorkbenchDao(Class<VNewWorkbench> type) {
		super(type);
	}
}
