package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.ExhibitionRoom;
import cn.com.topit.gl.dao.ExhibitionRoomDao;

public class ExhibitionRoomService extends AbstractService<ExhibitionRoom> {
	public List getExhibitionRoomsComboBox(final String whereSql) {
		return ((ExhibitionRoomDao) dao).getExhibitionRoomsComboBox(whereSql);
	}
}
