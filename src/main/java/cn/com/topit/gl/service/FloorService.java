package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Floor;
import cn.com.topit.gl.dao.FloorDao;

public class FloorService extends AbstractService<Floor> {
	public List getFloorsComboBox(final String whereSql) {
		return ((FloorDao) dao).getFloorsComboBox(whereSql);
	}
}
