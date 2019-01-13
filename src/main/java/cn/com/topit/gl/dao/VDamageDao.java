package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VDamageDao extends GenericDaoImpl<VDamage, Long>{
	private static final Logger log=LoggerFactory.getLogger(VDamageDao.class);
	public VDamageDao(Class<VDamage> type) {
		super(type);
	}
}
