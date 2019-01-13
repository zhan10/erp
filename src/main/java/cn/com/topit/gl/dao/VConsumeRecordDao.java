package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VConsumeRecordDao extends GenericDaoImpl<VConsumeRecord, Long>{
	private static final Logger log=LoggerFactory.getLogger(VConsumeRecordDao.class);
	public VConsumeRecordDao(Class<VConsumeRecord> type) {
		super(type);
	}
}
