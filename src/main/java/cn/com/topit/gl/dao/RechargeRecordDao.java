package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class RechargeRecordDao extends GenericDaoImpl<RechargeRecord, Long>{
	private static final Logger log=LoggerFactory.getLogger(RechargeRecordDao.class);
	public RechargeRecordDao(Class<RechargeRecord> type) {
		super(type);
	}
}
