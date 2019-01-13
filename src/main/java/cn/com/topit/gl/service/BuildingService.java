package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Building;
import cn.com.topit.gl.dao.BuildingDao;

public class BuildingService extends AbstractService<Building> {
	public List getBuildingsComboBox(final String whereSql) {
		return ((BuildingDao) dao).getBuildingsComboBox(whereSql);
	}
}
