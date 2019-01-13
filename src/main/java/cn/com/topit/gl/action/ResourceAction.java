package cn.com.topit.gl.action;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.base.TopitFilterSecurityInterceptor;
import cn.com.topit.base.TopitInvocationSecurityMetadataSource;
import cn.com.topit.common.util.ToolSpring;
import cn.com.topit.gl.service.ResourceService;

public class ResourceAction<Resource> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ResourceAction.class);
	private ResourceService service;

	public void setService(ResourceService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 查询树节点
	public String getNodes() {
		HttpServletRequest request = ServletActionContext.getRequest();
		// System.out.println(request.getParameter("path"));
		String node = request.getParameter("node");
		// System.out.println(request.getParameter("isXml"));
		try {
			Map map = service.getRecords(" and parentId=" + node, 1, 9999, order);
			// records.put("sum", map.get("count"));
			records.put("records", map.get("records"));

		} catch (Exception e) {
			log.error("managerExt出错：" + e.toString());
			e.printStackTrace();
		}
		/*
		 * Authentication
		 * authen=SecurityContextHolder.getContext().getAuthentication();
		 * 
		 * for (GrantedAuthority authority : authen.getAuthorities()){
		 * System.out.println(authority.getAuthority()); }
		 */
		return "managerExt";
	}
	// 根据资源ID保存对应的角色
	public void saveRoles() {
		HttpServletResponse response = ServletActionContext.getResponse();
		// String json = UTF2GBK.unicodeToUtf8(extJson);//
		// extjs中json.encode编码为unicode，要转换为utf-8
		response.reset();
		response.setCharacterEncoding("utf-8");
		try {
			service.saveRoles(extJson, others);
			response.getWriter().print("topit_ext_id!");loadResourcesDefine();
		} catch (Exception e) {
			log.error("保存出错" + e.getMessage());
			try {
				response.getWriter().print("保存出错！" + e.getMessage());
			} catch (IOException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
		}
	}
	// 根据角色保存对应的资源
	//传值extjson:资源id字符串列表（逗号分隔），others:角色id
		public void saveByRoles() {
			HttpServletResponse response = ServletActionContext.getResponse();
			// String json = UTF2GBK.unicodeToUtf8(extJson);//
			// extjs中json.encode编码为unicode，要转换为utf-8
			response.reset();
			response.setCharacterEncoding("utf-8");
			try {
				service.saveByRoles(extJson, others);
				response.getWriter().print("topit_ext_id!");loadResourcesDefine();
			} catch (Exception e) {
				log.error("保存出错" + e.getMessage());
				try {
					response.getWriter().print("保存出错！" + e.getMessage());
				} catch (IOException e1) {
					// TODO Auto-generated catch block
					e1.printStackTrace();
				}
			}
		}
	//返回角色－资源视图，resource_rolesManager.jsp
	public String rolesManager() throws Exception {
		return "rolesManager";
	}
	// 查询树节点
		public String getRolesResourcesNodes(){
			HttpServletRequest request = ServletActionContext.getRequest();		
			String rolesId = request.getParameter("rolesId");
			String node = request.getParameter("node");			
			try {
				Map map = service.getRecordsByRolesId(new Long(rolesId),new Long(node));
				records.put("records", map.get("records"));
			} catch (Exception e) {
				log.error("managerExt出错：" + e.toString());
				e.printStackTrace();
			}		
			return "managerExt";
		}
		private void loadResourcesDefine() {
			//重新加载security角色资源
			TopitFilterSecurityInterceptor tfsi=(TopitFilterSecurityInterceptor)ToolSpring.getBean("topitFilter");
			TopitInvocationSecurityMetadataSource resourceMap=(TopitInvocationSecurityMetadataSource)tfsi.obtainSecurityMetadataSource();
			resourceMap.loadResourcesDefine();		
		}
}
