package cn.com.topit.gl.service;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Products;
import cn.com.topit.gl.dao.ProductsDao;

public class ProductsService extends AbstractService<Products>  {
	public int updatePrice1(final Double price,final Long ids) throws Exception {
		return ((ProductsDao) dao).updatePrice1(price,ids);
	}
}
