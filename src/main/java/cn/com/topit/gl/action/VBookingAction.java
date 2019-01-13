package cn.com.topit.gl.action;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.topit.base.GenericActionSupport;
import net.sf.json.JSONObject;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.gl.service.VBookingService;
public class VBookingAction<VBooking> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingAction.class);
	private VBookingService service;
	public void setService(VBookingService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public String manager1() throws Exception {
		return "manager1";
	}
	public String manager2() throws Exception {
		return "manager2";
	}
	public String manager3() throws Exception {
		return "manager3";
	}
	public String manager4() throws Exception {
		return "manager4";
	}
	public String manager5() throws Exception {
		return "manager5";
	}
	public String manager6() throws Exception {
		return "manager6";
	}
	public String manager8() throws Exception {
		return "manager8";
	}
	public String getTotal() {//计算总价
    	// 格式为以逗号分隔的id列表，如1,3,6,7...
    	HttpServletResponse response = ServletActionContext.getResponse();
    	HttpServletRequest request=ServletActionContext.getRequest();
    	response.reset();
    	response.setCharacterEncoding("utf-8");
    	//int ids=Integer.parseInt(request.getParameter("id"));
    	//int status=Integer.parseInt(request.getParameter("status"));
    	String status=request.getParameter("status");
    	String bookingTime=request.getParameter("bookingTime");
    	String buildingName=request.getParameter("buildingName");
    	String code=request.getParameter("code");
    	String consumerName=request.getParameter("consumerName");
    	try {
    		Map map =service.getTotal(status,bookingTime,buildingName,code,consumerName);
    		records.put("records", map.get("records"));
    	} catch (Exception e) {
    	    log.error(e.toString());
    	    try {
    		response.getWriter().print("失败！");
    	    } catch (Exception ex) {
    		log.error(ex.toString());
    	    }
    	}
    	return "managerExt";
        }
}
