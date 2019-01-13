package cn.com.topit.base;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.SecurityMetadataSource;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.access.intercept.InterceptorStatusToken;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.intercept.FilterInvocationSecurityMetadataSource;

/*
 * 位于FILTER_SECURITY_INTERCEPTOR之前的filter
 * 一个自定义的filter，必须包含authenticationManager,accessDecisionManager,securityMetadataSource三个属性
 * 最核心的代码就是invoke方法中的InterceptorStatusToken token = super.beforeInvocation(fi);
 * 即在执行doFilter之前，进行权限的检查，而具体的实现已经交给accessDecisionManager了。
 */
public class TopitFilterSecurityInterceptor extends AbstractSecurityInterceptor
		implements Filter {
	private static final Logger log = LoggerFactory
			.getLogger(TopitFilterSecurityInterceptor.class);
	private FilterInvocationSecurityMetadataSource fisMetadataSource;

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * org.springframework.security.access.intercept.AbstractSecurityInterceptor
	 * #getSecureObjectClass()
	 */
	@Override
	public Class<?> getSecureObjectClass() {
		return FilterInvocation.class;
	}

	@Override
	public SecurityMetadataSource obtainSecurityMetadataSource() {
		return fisMetadataSource;
	}

	@Override
	public void destroy() {
	}

	@Override
	public void doFilter(ServletRequest request, ServletResponse response,
			FilterChain chain) throws IOException, ServletException {
		// super.beforeInvocation(fi);源码
		// 1.获取请求资源的权限
		// 执行Collection<ConfigAttribute> attributes =
		// SecurityMetadataSource.getAttributes(object);
		// 2.是否拥有权限
		// this.accessDecisionManager.decide(authenticated, object, attributes);
		log.info("开始拦截");
		FilterInvocation fi = new FilterInvocation(request, response, chain);
		InterceptorStatusToken token = super.beforeInvocation(fi);
		try {
			fi.getChain().doFilter(fi.getRequest(), fi.getResponse());
		} catch(org.springframework.security.access.AccessDeniedException ae){
			fi.getResponse().sendRedirect("./login.jsp");
		}catch (Exception e) {
		
			e.printStackTrace();
		} finally {
			super.afterInvocation(token, null);
		}
		log.info("拦截结束");
		
	}

	@Override
	public void init(FilterConfig config) throws ServletException {

	}

	public void setFisMetadataSource(
			FilterInvocationSecurityMetadataSource fisMetadataSource) {
		this.fisMetadataSource = fisMetadataSource;
	}
}