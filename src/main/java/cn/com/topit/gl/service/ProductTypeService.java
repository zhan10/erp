package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.ProductType;
import cn.com.topit.gl.dao.ProductTypeDao;

public class ProductTypeService extends AbstractService<ProductType> {
	public List getProductTypesComboBox(final String whereSql) {
		return ((ProductTypeDao) dao).getProductTypesComboBox(whereSql);
	}
}