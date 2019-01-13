package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.VipRoomDao;
import cn.com.topit.gl.dao.VipRoom;
public class VipRoomService extends AbstractService<VipRoom>{
	public List getVipRoomsComboBox(final String whereSql) {
		return ((VipRoomDao) dao).getVipRoomsComboBox(whereSql);
	}
}
