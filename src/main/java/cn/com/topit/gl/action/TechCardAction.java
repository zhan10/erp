package cn.com.topit.gl.action;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.TechCard;
import cn.com.topit.gl.service.TechCardService;
public class TechCardAction extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(TechCardAction.class);
	private TechCardService service;
	public void setService(TechCardService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	//保存工艺卡片及关联的定单
	//先删除与工艺卡片相关联的定单再添加新定单
	public void saveAll() {
		HttpServletResponse response = ServletActionContext.getResponse();
		TechCard t;
		//String json = UTF2GBK.unicodeToUtf8(extJson);// extjs中json.encode编码为unicode，要转换为utf-8
		String json =(extJson);		
		response.reset();
		response.setCharacterEncoding("utf-8");
		log.info(json);
		try {			
			t = (TechCard) service.saveAll(json,others);
			response.getWriter().print("topit_ext_id!" + t.getId());
		} catch (Exception e) {
			log.error("保存出错" + e.getMessage());
			try {
				response.getWriter().print("保存出错！"+e.getMessage());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	public String roughRollManager() throws Exception {
		return "roughRollManager";
	}
}
