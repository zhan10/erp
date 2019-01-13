package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.AreaDao;
import cn.com.topit.gl.dao.VNewBookingList;
import cn.com.topit.gl.dao.VNewBookingListDao;
public class VNewBookingListService extends AbstractService<VNewBookingList>{
	public List getProductBooking(final String whereSql) {
		return ((VNewBookingListDao) dao).getProductBooking(whereSql);
	}
}
