package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VOfficeDao extends GenericDaoImpl<VOffice, Long>{
	private static final Logger log=LoggerFactory.getLogger(VOfficeDao.class);
	public VOfficeDao(Class<VOffice> type) {
		super(type);
	}
}
