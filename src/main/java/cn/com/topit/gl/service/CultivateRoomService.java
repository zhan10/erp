package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.CultivateRoom;
import cn.com.topit.gl.dao.CultivateRoomDao;
public class CultivateRoomService extends AbstractService<CultivateRoom>{
	public List getCultivateRoomComboBox(final String whereSql) {
		return ((CultivateRoomDao) dao).getCultivateRoomComboBox(whereSql);
	}
}
