package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VNewBookingListService;
public class VNewBookingListAction<VNewBookingList> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VNewBookingListAction.class);
	private VNewBookingListService service;
	public void setService(VNewBookingListService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	//获取产品订单
	public String getProductBooking() {
		try {
			records.put("records",  service
					.getProductBooking(baseSql + whereSql+order));
		} catch (Exception e) {
			log.error("getProductBooking出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}
