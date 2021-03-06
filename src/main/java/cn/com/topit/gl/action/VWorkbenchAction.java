package cn.com.topit.gl.action;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import cn.com.topit.base.GenericActionSupport;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.gl.service.VWorkbenchService;
public class VWorkbenchAction<VWorkbench> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VWorkbenchAction.class);
	private VWorkbenchService service;
	public void setService(VWorkbenchService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	
	public String getType() {
    	// 格式为以逗号分隔的id列表，如1,3,6,7...
    	HttpServletResponse response = ServletActionContext.getResponse();
    	HttpServletRequest request=ServletActionContext.getRequest();
    	response.reset();
    	response.setCharacterEncoding("utf-8");
    	int ids=Integer.parseInt(request.getParameter("id"));
    	try {
    		System.out.print("5555555555555555555:"+ids);
    		Map map =service.getGenre(ids);
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
