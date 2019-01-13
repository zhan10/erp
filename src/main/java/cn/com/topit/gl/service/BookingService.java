package cn.com.topit.gl.service;
import java.util.List;

import cn.com.topit.base.AbstractService;
import cn.com.topit.gl.dao.Booking;
import cn.com.topit.gl.dao.BookingDao;
public class BookingService extends AbstractService<Booking>{
	public List getBookingComboBox(final String whereSql) {
		return ((BookingDao) dao).getBookingComboBox(whereSql);
	}
}
