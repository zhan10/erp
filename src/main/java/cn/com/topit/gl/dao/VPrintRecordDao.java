package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class VPrintRecordDao extends GenericDaoImpl<VPrintRecord, Long>{
	private static final Logger log=LoggerFactory.getLogger(VPrintRecordDao.class);
	public VPrintRecordDao(Class<VPrintRecord> type) {
		super(type);
	}
}
