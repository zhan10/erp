package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.OfficeType;
import cn.com.topit.gl.dao.OfficeTypeDao;

public class OfficeTypeService extends AbstractService<OfficeType> {
	public List getOfficeTypesComboBox(final String whereSql) {
		return ((OfficeTypeDao) dao).getOfficeTypesComboBox(whereSql);
	}
}
