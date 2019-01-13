package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Custom;
import cn.com.topit.gl.dao.CustomDao;
public class CustomService extends AbstractService<Custom>{
	public List getCustomComboBox(final String whereSql) {
		return ((CustomDao)dao).getCustomComboBox(whereSql);
	}
}
