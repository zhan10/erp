package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.WorkbenchType;
import cn.com.topit.gl.dao.WorkbenchTypeDao;
public class WorkbenchTypeService extends AbstractService<WorkbenchType>{
	public List getWorkbenchTypesComboBox(final String whereSql) {
		return ((WorkbenchTypeDao) dao).getWorkbenchTypesComboBox(whereSql);
	}
}
