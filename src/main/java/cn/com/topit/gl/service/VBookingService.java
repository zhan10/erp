package cn.com.topit.gl.service;
import java.util.HashMap;
import java.util.Map;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.VBooking;
import cn.com.topit.gl.dao.VBookingDao;
import cn.com.topit.gl.dao.VWorkbenchDao;
public class VBookingService extends AbstractService<VBooking>{
	public Map getTotal(String status,String bookingTime,String buildingName,
			String code,String consumerName) {
		Map map = new HashMap();
		map.put("records",((VBookingDao) dao).getTotal(status,bookingTime,buildingName,code,consumerName));
		return map;
	}
}
