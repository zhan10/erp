package cn.com.topit.gl.action;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.ErpCabinetService;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
public class ErpCabinetAction<ErpCabinet> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ErpCabinetAction.class);
	private ErpCabinetService service;
	public void setService(ErpCabinetService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	public void save() {
		HttpServletResponse response = ServletActionContext.getResponse();
		cn.com.topit.gl.dao.ErpCabinet erpCabinet = null;
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		String json = (extJson);
		JSONArray jsonArray=JSONArray.fromObject(json);	
		
		response.reset();
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html");
		log.info(json);
		try {
				for(int i=0;i<jsonArray.size();i++) {
					JSONObject jsonObject = jsonArray.getJSONObject(i);
					erpCabinet = service.saveByJSONObject(jsonObject);
				}
				response.getWriter().print(
						"topit_ext_id!" + erpCabinet.getId());
				// System.out.println("topit_ext_id!" + workbench.getId());
		} catch (Exception e) {
			e.printStackTrace();
			log.error("保存出错" + e.getMessage());
			try {
				response.getWriter().print(
						"{success:false,errMsg:" + e.getMessage() + "}");
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
}
