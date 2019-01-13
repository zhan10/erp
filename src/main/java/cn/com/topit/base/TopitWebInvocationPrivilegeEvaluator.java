/*******************************************************************************
 * Copyright (c) 2013-11-24 @author doom.
 * All rights reserved.
 *
 * 为解决页面<sec:authorize url 在动态角色无法使用重写DefaultWebInvocationPrivilegeEvaluator
 ******************************************************************************/
package cn.com.topit.base;

import java.util.Collection;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.access.ConfigAttribute;
import org.springframework.security.access.intercept.AbstractSecurityInterceptor;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.FilterInvocation;
import org.springframework.security.web.access.WebInvocationPrivilegeEvaluator;

/**
 * @author <a href="mailto:iffiff1@hotmail.com">Tyler Chen</a>
 * @since 2011-11-24
 */
public class TopitWebInvocationPrivilegeEvaluator implements WebInvocationPrivilegeEvaluator {
	private final AbstractSecurityInterceptor securityInterceptor;
	public TopitWebInvocationPrivilegeEvaluator(
			AbstractSecurityInterceptor securityInterceptor) {
		this.securityInterceptor = securityInterceptor;
	}

	// ~ Static fields/initializers
	// =====================================================================================

	private static final Logger log = LoggerFactory
			.getLogger(TopitWebInvocationPrivilegeEvaluator.class);

	 /**
     * Determines whether the user represented by the supplied <tt>Authentication</tt> object is
     * allowed to invoke the supplied URI.
     *
     * @param uri the URI excluding the context path (a default context path setting will be used)
     */
	public boolean isAllowed(String uri, Authentication authentication) {
		// TODO Auto-generated method stub
		 return isAllowed(null, uri, null, authentication);
	}

	
	 /**
     * Determines whether the user represented by the supplied <tt>Authentication</tt> object is
     * allowed to invoke the supplied URI, with the given .
     * <p>
     * Note the default implementation of <tt>FilterInvocationSecurityMetadataSource</tt> disregards the
     * <code>contextPath</code> when evaluating which secure object metadata applies to a given
     * request URI, so generally the <code>contextPath</code> is unimportant unless you
     * are using a custom <code>FilterInvocationSecurityMetadataSource</code>.
     *
     * @param uri the URI excluding the context path
     * @param contextPath the context path (may be null, in which case a default value will be used).
     * 如项目根路径为http://localhost:8080/test，则contextPath=/test;
     * @param method the HTTP method (or null, for any method)
     * @param authentication the <tt>Authentication</tt> instance whose authorities should be used in evaluation
     *          whether access should be granted.
     * @return true if access is allowed, false if denied
     */
	public boolean isAllowed(String contextPath, String uri, String method, Authentication authentication) {
		// TODO Auto-generated method stub
		FilterInvocation fi = new FilterInvocation("", uri, method);	//若数据库中配置了项目名，如/test/hr/users_manager，则直接使用contextPath，不能设为""	
	        Collection<ConfigAttribute> attrs = securityInterceptor.obtainSecurityMetadataSource().getAttributes(fi);

	       /* if (attrs == null) {
	            if (securityInterceptor.isRejectPublicInvocations()) {
	                return false;
	            }

	            return true;
	        }

	        if (authentication == null) {
	            return false;
	        }*/

	        try {
	            securityInterceptor.getAccessDecisionManager().decide(authentication, fi, attrs);
	        } catch (AccessDeniedException unauthorized) {	           
	                log.info(" denied for " + authentication.toString(), unauthorized); 
	            return false;
	        }

	        return true;
	    }
	}
	
	/*public class DefaultWebInvocationPrivilegeEvaluator implements WebInvocationPrivilegeEvaluator {
	    //~ Static fields/initializers =====================================================================================

	    protected static final Log logger = LogFactory.getLog(DefaultWebInvocationPrivilegeEvaluator.class);

	    //~ Instance fields ================================================================================================

	    private final AbstractSecurityInterceptor securityInterceptor;

	    //~ Constructors ===================================================================================================

	    public DefaultWebInvocationPrivilegeEvaluator(AbstractSecurityInterceptor securityInterceptor) {
	        Assert.notNull(securityInterceptor, "SecurityInterceptor cannot be null");
	        Assert.isTrue(FilterInvocation.class.equals(securityInterceptor.getSecureObjectClass()),
	            "AbstractSecurityInterceptor does not support FilterInvocations");
	        Assert.notNull(securityInterceptor.getAccessDecisionManager(),
	            "AbstractSecurityInterceptor must provide a non-null AccessDecisionManager");

	        this.securityInterceptor = securityInterceptor;
	    }

	    //~ Methods ========================================================================================================

	    *//**
	     * Determines whether the user represented by the supplied <tt>Authentication</tt> object is
	     * allowed to invoke the supplied URI.
	     *
	     * @param uri the URI excluding the context path (a default context path setting will be used)
	     *//*
	    public boolean isAllowed(String uri, Authentication authentication) {
	        return isAllowed(null, uri, null, authentication);
	    }

	    *//**
	     * Determines whether the user represented by the supplied <tt>Authentication</tt> object is
	     * allowed to invoke the supplied URI, with the given .
	     * <p>
	     * Note the default implementation of <tt>FilterInvocationSecurityMetadataSource</tt> disregards the
	     * <code>contextPath</code> when evaluating which secure object metadata applies to a given
	     * request URI, so generally the <code>contextPath</code> is unimportant unless you
	     * are using a custom <code>FilterInvocationSecurityMetadataSource</code>.
	     *
	     * @param uri the URI excluding the context path
	     * @param contextPath the context path (may be null, in which case a default value will be used).
	     * @param method the HTTP method (or null, for any method)
	     * @param authentication the <tt>Authentication</tt> instance whose authorities should be used in evaluation
	     *          whether access should be granted.
	     * @return true if access is allowed, false if denied
	     *//*
	    public boolean isAllowed(String contextPath, String uri, String method, Authentication authentication) {
	        Assert.notNull(uri, "uri parameter is required");

	        FilterInvocation fi = new FilterInvocation(contextPath, uri, method);
	        Collection<ConfigAttribute> attrs = securityInterceptor.obtainSecurityMetadataSource().getAttributes(fi);

	        if (attrs == null) {
	            if (securityInterceptor.isRejectPublicInvocations()) {
	                return false;
	            }

	            return true;
	        }

	        if (authentication == null) {
	            return false;
	        }

	        try {
	            securityInterceptor.getAccessDecisionManager().decide(authentication, fi, attrs);
	        } catch (AccessDeniedException unauthorized) {
	            if (logger.isDebugEnabled()) {
	                logger.debug(fi.toString() + " denied for " + authentication.toString(), unauthorized);
	            }

	            return false;
	        }

	        return true;
	    }
	}*/
	
