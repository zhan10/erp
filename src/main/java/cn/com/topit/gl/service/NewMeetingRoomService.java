package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.NewMeetingRoom;
import cn.com.topit.gl.dao.NewMeetingRoomDao;
import cn.com.topit.gl.dao.NewWorkbenchDao;
public class NewMeetingRoomService extends AbstractService<NewMeetingRoom>{
	public List getMeetingRoomComboBox(final String whereSql) {
		return ((NewMeetingRoomDao) dao).getMeetingRoomComboBox(whereSql);
	}
}
