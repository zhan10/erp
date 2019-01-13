package cn.com.topit.base;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.SecurityConfig;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;
import org.springframework.util.AntPathMatcher;

import cn.com.topit.gl.dao.Roles;
import cn.com.topit.gl.service.RoleResourceService;
import cn.com.topit.gl.service.RolesService;

/**
 * @description 资源源数据定义，将所有的资源和权限对应关系建立起来，即定义某一资源可以被哪些角色访问
 */
public class TopitInvocationSecurityMetadataSource implements
		FilterInvocationSecurityMetadataSource {
	private RolesService rolesService;
	private RoleResourceService roleResourceService;
	private AntPathMatcher urlMatcher = new AntPathMatcher();;
	private static Map<String, Collection<ConfigAttribute>> resourceMap = null;
	private static final Logger log = LoggerFactory
			.getLogger(TopitInvocationSecurityMetadataSource.class);

	public TopitInvocationSecurityMetadataSource(RolesService rolesService,
			RoleResourceService roleResourceService) {
		this.rolesService = rolesService;
		this.roleResourceService = roleResourceService;
		loadResourcesDefine();
	}

	public void loadResourcesDefine() {
		resourceMap = new HashMap<String, Collection<ConfigAttribute>>();
		/*
		 * Collection<ConfigAttribute> atts = new ArrayList<ConfigAttribute>();
		 * ConfigAttribute ca = new SecurityConfig("ROLE_ADMIN"); atts.add(ca);
		 * resourceMap.put("/index.jsp", atts);
		 * resourceMap.put("/hr/users_manager", atts);
		 * resourceMap.put("/hr/roles!save", atts); resourceMap.put("/i.jsp",
		 * atts);
		 */
		log.info("加载资源--角色对应信息");
		List<Roles> roles = rolesService.findBySql("");
		for (Roles role : roles) {
			List<String> resourcesUrls = roleResourceService
					.findResourceUrlsByRoleName(role.getName());
			for (String url : resourcesUrls) {
				Collection<ConfigAttribute> configAttributes = null;
				ConfigAttribute configAttribute = new SecurityConfig(
						role.getName());
				log.info(url);
				log.info(role.getName());
				if (resourceMap.containsKey(url)) {
					configAttributes = resourceMap.get(url);
					configAttributes.add(configAttribute);
				} else {
					configAttributes = new ArrayList<ConfigAttribute>();
					configAttributes.add(configAttribute);
					resourceMap.put(url, configAttributes);
				}
			}
		}
	}

	/*
	 * 根据请求的资源地址，获取它所拥有的权限
	 */
	@Override
	public Collection<ConfigAttribute> getAttributes(Object obj)
			throws IllegalArgumentException {
		// 获取请求的url地址
		String url = ((FilterInvocation) obj).getRequestUrl();
		if (url.indexOf("?") != -1) {
			url = url.substring(0, url.indexOf("?"));
		}
		log.info("请求地址为：" + url);
		// System.out.println("MySecurityMetadataSource:getAttributes()---------------请求地址为："+url);
		Iterator<String> it = resourceMap.keySet().iterator();
		while (it.hasNext()) {
			String _url = it.next();
			log.info("资源配置地址为：" + _url);
			if (_url.indexOf("?") != -1) {
				_url = _url.substring(0, _url.indexOf("?"));
			}
			if (urlMatcher.match(_url, url)){
				log.info("权限匹配成功！");			
				return resourceMap.get(_url);
			}
		}
		return null;
	}

	public boolean supports(Class<?> clazz) {
		return true;
	}

	public Collection<ConfigAttribute> getAllConfigAttributes() {
		return null;
	}

}