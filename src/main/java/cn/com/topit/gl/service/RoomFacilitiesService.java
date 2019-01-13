package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.OfficeTypeDao;
import cn.com.topit.gl.dao.RoomFacilities;
import cn.com.topit.gl.dao.RoomFacilitiesDao;

public class RoomFacilitiesService extends AbstractService<RoomFacilities> {
	public List getRoomFacilitiesComboBox(final String whereSql) {
		return ((RoomFacilitiesDao) dao).getRoomFacilitiesComboBox(whereSql);
	}
}
