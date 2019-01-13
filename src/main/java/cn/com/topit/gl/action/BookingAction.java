package cn.com.topit.gl.action;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.BookingService;
public class BookingAction<Booking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(BookingAction.class);
	private BookingService service;
	public void setService(BookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
	public String getBookingComboBox() {
		try {
			records.put("records",  service
					.getBookingComboBox(baseSql + whereSql+order));
		} catch (Exception e) {
			log.error("getBookingComboBox出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}
