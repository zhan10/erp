package cn.com.topit.gl.action;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.common.util.SMS;
import cn.com.topit.gl.service.ErpOrdersService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class ErpOrdersAction<ErpOrders> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ErpOrdersAction.class);
	private ErpOrdersService service;
	public void setService(ErpOrdersService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public void save() {
	    HttpServletResponse response = ServletActionContext.getResponse();
	    cn.com.topit.gl.dao.ErpOrders erp = null;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		String json = (extJson);
		JSONObject jsonObject=JSONObject.fromObject(json);	
		response.reset();
		response.setCharacterEncoding("utf-8");
		log.info(json);
		try {
		    erp = service.saveByJson(json);
		    if(jsonObject.containsKey("data")){
				JSONObject pam = new JSONObject();
				JSONObject data = jsonObject.getJSONObject("data");
				String code = "";
				if(jsonObject.getInt("status")==2) {
					code = "SMS_158491632";
					pam.put("customerName", data.getString("name"));
					pam.put("designerName", data.getString("userName"));
					pam.put("designer", data.getString("code"));
				}else if(jsonObject.getInt("status")==4) {
					code = "SMS_158491630";
					pam.put("customerName", data.getString("name"));
				}
				SMS.sendSms(data.getString("mobile"), code, pam.toString());
			};
		    response.getWriter().print("topit_ext_id!" + erp.getId());
		} catch (Exception e) {
		    e.printStackTrace();
		    log.error("保存出错" + e.getMessage());
		    try {
			response.getWriter().print("保存出错！" + e.getMessage());
		    } catch (IOException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		    }
		}
	}
}
