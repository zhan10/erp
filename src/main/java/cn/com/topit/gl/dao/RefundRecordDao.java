package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class RefundRecordDao extends GenericDaoImpl<RefundRecord, Long>{
	private static final Logger log=LoggerFactory.getLogger(RefundRecordDao.class);
	public RefundRecordDao(Class<RefundRecord> type) {
		super(type);
	}
}
