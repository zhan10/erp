package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VRechargeRecordDao extends GenericDaoImpl<VRechargeRecord, Long>{
	private static final Logger log=LoggerFactory.getLogger(VRechargeRecordDao.class);
	public VRechargeRecordDao(Class<VRechargeRecord> type) {
		super(type);
	}
}
