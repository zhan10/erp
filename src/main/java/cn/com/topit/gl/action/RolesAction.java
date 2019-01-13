package cn.com.topit.gl.action;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.*;
import cn.com.topit.gl.service.RolesService;

public class RolesAction extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory
			.getLogger(RolesAction.class);
	private RolesService service;

	public void setService(RolesService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	
	//保存角色信息及相关的人员信息
		//先删除角色关联用户再添加
		public void saveUsers() {
			HttpServletResponse response = ServletActionContext.getResponse();
			Roles t;
			//String json = UTF2GBK.unicodeToUtf8(extJson);// extjs中json.encode编码为unicode，要转换为utf-8
			String json =(extJson);		
			response.reset();
			response.setCharacterEncoding("utf-8");
			log.info(json);
			try {			
				t = (Roles) service.saveUsers(json,others);
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

		//根据用户分配的角色保存
			public void saveByUsers() {
				HttpServletResponse response = ServletActionContext.getResponse();
				//String json = UTF2GBK.unicodeToUtf8(extJson);// extjs中json.encode编码为unicode，要转换为utf-8
				response.reset();
				response.setCharacterEncoding("utf-8");				
				try {			
					service.saveByUsers(extJson,others);
					response.getWriter().print("topit_ext_id!" );
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
		public String usersManager() throws Exception {
			return "usersManager";
		}
}
