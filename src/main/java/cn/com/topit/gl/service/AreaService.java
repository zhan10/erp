package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Area;
import cn.com.topit.gl.dao.AreaDao;

public class AreaService extends AbstractService<Area> {
	public List getAreasComboBox(final String whereSql) {
		return ((AreaDao) dao).getAreasComboBox(whereSql);
	}
}
