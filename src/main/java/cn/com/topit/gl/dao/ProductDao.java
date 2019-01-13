package cn.com.topit.gl.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericDaoImpl;
public class ProductDao extends GenericDaoImpl<Product, Long>{
	private static final Logger log=LoggerFactory.getLogger(ProductDao.class);
	public ProductDao(Class<Product> type) {
		super(type);
	}
}
