package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class ErpCabinetDao extends GenericDaoImpl<ErpCabinet, Long>{
	private static final Logger log=LoggerFactory.getLogger(ErpCabinetDao.class);
	public ErpCabinetDao(Class<ErpCabinet> type) {
		super(type);
	}
}
