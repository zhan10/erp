package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Office;
import cn.com.topit.gl.dao.OfficeDao;
public class OfficeService extends AbstractService<Office>{
	public List getOfficesComboBox(final String whereSql) {
		return ((OfficeDao) dao).getOfficesComboBox(whereSql);
	}
}
