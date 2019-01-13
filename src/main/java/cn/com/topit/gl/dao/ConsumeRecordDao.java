package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class ConsumeRecordDao extends GenericDaoImpl<ConsumeRecord, Long>{
	private static final Logger log=LoggerFactory.getLogger(ConsumeRecordDao.class);
	public ConsumeRecordDao(Class<ConsumeRecord> type) {
		super(type);
	}
}
