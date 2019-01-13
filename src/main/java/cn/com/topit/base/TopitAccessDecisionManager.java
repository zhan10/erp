package cn.com.topit.base;

import java.util.Collection;
import java.util.Iterator;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDecisionManager;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;

/**
 * @description 访问决策器，决定某个用户具有的角色，是否有足够的权限去访问某个资源 ;做最终的访问控制决定
 * @author doom
 * @date 2014-4-1
 */
public class TopitAccessDecisionManager implements AccessDecisionManager {
	private static final Logger log = LoggerFactory
			.getLogger(TopitAccessDecisionManager.class);
	// In this method, need to compare authentication with configAttributes.
	// 1, A object is a URL, a filter was find permission configuration by this
	// URL, and pass to here.
	// 2, Check authentication has attribute in permission configuration
	// (configAttributes)
	// 3, If not match corresponding authentication, throw a
	// AccessDeniedException.
	/**
	 * @description 认证用户是否具有权限访问该url地址
	 * 
	 */
	public void decide(Authentication authentication, Object object,
			Collection<ConfigAttribute> configAttributes)
			throws AccessDeniedException, InsufficientAuthenticationException {
		/*
		 * if (configAttributes == null) { return; }
		 * System.out.println(object.toString()); // object is a URL.
		 * Iterator<ConfigAttribute> ite = configAttributes.iterator(); while
		 * (ite.hasNext()) { ConfigAttribute ca = ite.next(); String needRole =
		 * ((SecurityConfig) ca).getAttribute(); for (GrantedAuthority ga :
		 * authentication.getAuthorities()) { if
		 * (needRole.equals(ga.getAuthority())) { // ga is user's role. return;
		 * } } } throw new AccessDeniedException("no right");
		 */
		log.debug("验证用户是否具有一定的权限");
		if (configAttributes == null)
			return;
		Iterator<ConfigAttribute> it = configAttributes.iterator();
		while (it.hasNext()) {
			String needRole = it.next().getAttribute();
			// authentication.getAuthorities() 用户所有的权限
			for (GrantedAuthority ga : authentication.getAuthorities()) {
				log.debug("用户权限："+ga.getAuthority());
				if (needRole.equals(ga.getAuthority())) { // ga is user's role.
					return;
				}
			}
		}
		log.warn("权限认证失败(无权访问)");
		throw new AccessDeniedException(
				"--------MyAccessDescisionManager：decide-------权限认证失败(无权访问)！");
	}

	/**
	 * 启动时候被AbstractSecurityInterceptor调用，
	 * 决定AccessDecisionManager是否可以执行传递ConfigAttribute。
	 */
	@Override
	public boolean supports(ConfigAttribute attribute) {
		// TODO Auto-generated method stub
		return true;
	}

	/**
	 * 被安全拦截器实现调用，包含安全拦截器将显示的AccessDecisionManager支持安全对象的类型
	 */
	@Override
	public boolean supports(Class<?> clazz) {
		return true;
	}

}