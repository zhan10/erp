package cn.com.topit.gl.action;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.topit.base.GenericActionSupport;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.gl.service.VBookingWorkbenchService;
public class VBookingWorkbenchAction<VBookingWorkbench> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VBookingWorkbenchAction.class);
	private VBookingWorkbenchService service;
	public void setService(VBookingWorkbenchService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public String getGenre() {
    	// 格式为以逗号分隔的id列表，如1,3,6,7...
    	HttpServletResponse response = ServletActionContext.getResponse();
    	HttpServletRequest request=ServletActionContext.getRequest();
    	response.reset();
    	response.setCharacterEncoding("utf-8");
    	int typeId=Integer.parseInt(request.getParameter("typeId"));
    	try {
    		Map map =service.getGenre(typeId);
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
