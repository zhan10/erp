package cn.com.topit.gl.dao;
import org.hibernate.Query;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class ErpCabinetsDao extends GenericDaoImpl<ErpCabinets, Long>{
	private static final Logger log=LoggerFactory.getLogger(ErpCabinetsDao.class);
	public ErpCabinetsDao(Class<ErpCabinets> type) {
		super(type);
	}
}
