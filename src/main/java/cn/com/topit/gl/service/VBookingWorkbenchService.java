package cn.com.topit.gl.service;
import java.util.HashMap;
import java.util.Map;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.VBookingWorkbench;
import cn.com.topit.gl.dao.VBookingWorkbenchDao;
public class VBookingWorkbenchService extends AbstractService<VBookingWorkbench>{
	public Map getGenre(int typeId) {
		Map map = new HashMap();
		map.put("records",((VBookingWorkbenchDao) dao).getGenre(typeId));
		return map;
	}
}
