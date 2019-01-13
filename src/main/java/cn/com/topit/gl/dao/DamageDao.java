package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class DamageDao extends GenericDaoImpl<Damage, Long>{
	private static final Logger log=LoggerFactory.getLogger(DamageDao.class);
	public DamageDao(Class<Damage> type) {
		super(type);
	}
}
