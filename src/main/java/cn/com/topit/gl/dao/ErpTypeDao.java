package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class ErpTypeDao extends GenericDaoImpl<ErpType, Long>{
	private static final Logger log=LoggerFactory.getLogger(ErpTypeDao.class);
	public ErpTypeDao(Class<ErpType> type) {
		super(type);
	}
}
