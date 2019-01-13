package cn.com.topit.gl.service;

import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.MeetingRoom;
import cn.com.topit.gl.dao.MeetingRoomDao;

public class MeetingRoomService extends AbstractService<MeetingRoom> {
	public List getMeetingRoomsComboBox(final String whereSql) {
		return ((MeetingRoomDao) dao).getMeetingRoomsComboBox(whereSql);
	}
}
