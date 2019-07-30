package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class ErpMetalsDao extends GenericDaoImpl<ErpMetals, Long>{
	private static final Logger log=LoggerFactory.getLogger(ErpMetalsDao.class);
	public ErpMetalsDao(Class<ErpMetals> type) {
		super(type);
	}
}
