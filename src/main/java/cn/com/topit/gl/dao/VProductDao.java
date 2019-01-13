package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class VProductDao extends GenericDaoImpl<VProduct, Long>{
	private static final Logger log=LoggerFactory.getLogger(VProductDao.class);
	public VProductDao(Class<VProduct> type) {
		super(type);
	}
}
