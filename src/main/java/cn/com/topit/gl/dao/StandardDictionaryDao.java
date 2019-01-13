package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class StandardDictionaryDao extends GenericDaoImpl<StandardDictionary, Long>{
	private static final Logger log=LoggerFactory.getLogger(StandardDictionaryDao.class);
	public StandardDictionaryDao(Class<StandardDictionary> type) {
		super(type);
	}
}
