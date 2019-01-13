package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VNewOfficeDao extends GenericDaoImpl<VNewOffice, Long>{
	private static final Logger log=LoggerFactory.getLogger(VNewOfficeDao.class);
	public VNewOfficeDao(Class<VNewOffice> type) {
		super(type);
	}
}
