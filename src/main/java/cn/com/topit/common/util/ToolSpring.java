package cn.com.topit.common.util;

import org.springframework.context.ApplicationContext;
import org.springframework.context.ApplicationContextAware;

/**
 * 
 * 获取spring信息的工具类 * application-context中配置 <bean id="toolSpring"
 * class="cn.com.topit.common.util.ToolSpring"></bean>
 * 取bean时　ToolSpring.getBean("beanId");就可以进行调用了。
 * 
 * @author doom *
 */

public final class ToolSpring implements ApplicationContextAware {
	private static ApplicationContext applicationContext = null;

	@Override
	public void setApplicationContext(ApplicationContext context){
		if (applicationContext == null) {
			applicationContext = context;
		}
	}
	

	public static ApplicationContext getAppContext() {
		return applicationContext;
	}

	public static Object getBean(String name) {
		String[] str=applicationContext.getBeanDefinitionNames();
		for(int i=0;i<str.length;i++)
			System.out.println(str[i]);
		return applicationContext.getBean(name);
	}

}