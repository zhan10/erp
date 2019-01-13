package cn.com.topit.common.util;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.support.WebApplicationObjectSupport;

/**
 * 
 * 获取spring信息的工具类 * application-context中配置 <bean id="toolSpring"
 * class="cn.com.topit.common.util.ToolSpring"></bean>
 * 取bean时　ToolSpring.getBean("beanId");就可以进行调用了。
 * 
 * @author doom *
 */

public final class CopyOfToolSpring extends WebApplicationObjectSupport {
	private static ApplicationContext applicationContext = null;

	@Override
	protected void initApplicationContext(ApplicationContext context) {
		super.initApplicationContext(context);
		if (applicationContext == null) {
			applicationContext = context;
		}

	}

	public static ApplicationContext getAppContext() {
		return applicationContext;
	}

	public static Object getBean(String name) {
		return applicationContext.getBean(name);
	}

}