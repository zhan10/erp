package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.TelRoomDao;
import cn.com.topit.gl.dao.TelRoom;
public class TelRoomService extends AbstractService<TelRoom>{
	public List getTelRoomsComboBox(final String whereSql) {
		return ((TelRoomDao) dao).getTelRoomsComboBox(whereSql);
	}
}
