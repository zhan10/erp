package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VRefundRecordDao extends GenericDaoImpl<VRefundRecord, Long>{
	private static final Logger log=LoggerFactory.getLogger(VRefundRecordDao.class);
	public VRefundRecordDao(Class<VRefundRecord> type) {
		super(type);
	}
}
