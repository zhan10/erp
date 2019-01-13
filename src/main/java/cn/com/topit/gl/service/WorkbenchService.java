package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.WorkbenchDao;
import cn.com.topit.gl.dao.Workbench;

public class WorkbenchService extends AbstractService<Workbench> {
	public List getWorkbenchsComboBox(final String whereSql) {
		return ((WorkbenchDao) dao).getWorkbenchsComboBox(whereSql);
	}
}
