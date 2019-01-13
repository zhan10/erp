package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.City;
import cn.com.topit.gl.dao.CityDao;
public class CityService extends AbstractService<City>{
	public List getCitiesComboBox(final String whereSql) {
		return ((CityDao) dao).getCitiesComboBox(whereSql);
	}
}
