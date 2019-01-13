package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.NewOffice;
import cn.com.topit.gl.dao.NewOfficeDao;
import cn.com.topit.gl.dao.NewWorkbenchDao;
public class NewOfficeService extends AbstractService<NewOffice>{
	public List getOfficeComboBox(final String whereSql) {
		return ((NewOfficeDao) dao).getOfficeComboBox(whereSql);
	}
}
