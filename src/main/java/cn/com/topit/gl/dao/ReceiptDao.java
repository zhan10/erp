package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericDaoImpl;
public class ReceiptDao extends GenericDaoImpl<Receipt, Long>{
	private static final Logger log=LoggerFactory.getLogger(ReceiptDao.class);
	public ReceiptDao(Class<Receipt> type) {
		super(type);
	}
}
