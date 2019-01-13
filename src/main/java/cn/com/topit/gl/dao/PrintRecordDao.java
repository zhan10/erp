package cn.com.topit.gl.dao;
import java.util.List;
import cn.com.topit.base.GenericDao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class PrintRecordDao extends GenericDaoImpl<PrintRecord, Long>{
	private static final Logger log=LoggerFactory.getLogger(PrintRecordDao.class);
	public PrintRecordDao(Class<PrintRecord> type) {
		super(type);
	}
}
