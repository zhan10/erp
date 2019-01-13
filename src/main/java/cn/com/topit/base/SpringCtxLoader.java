package cn.com.topit.base;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationObjectSupport;

/*此工具类暂未使用
 * Spring提供了一个WebApplicationObjectSupport类来供我们使用，
 * 用来把定义在spring中的对象与前台页面联系起来。
 *  为了在页面中可以方便的通过EL表达式取出spring里的bean，
 *  我们需要借助HashMap的特性并重写其方法。
 *   首先，需要一个继承WebApplicationObjectSupport的类，
 *   并重写其initApplicationContext()方法，并把该类配置在Spring中，
 *   且lazy-init=false，自动加载。
 *   该类的主要作用就是把一重写了get方法的HashMap以"springctx"的名字存放着ServletContext中，
 *   在页面通过类似于"${springctx.xxxxx}"就可以调用到spring里的bean。
 *   可以用"${springctx.xxxx}"来访问spring里的对象了。
 *   EL表达式中可以采用两种方式访问一个Map，一种方式是${map.key}另一种方式式${map[“key”]}，
 *   其中后者应用更为广泛，比如如果key为一个包含“.”或者空格的字符串，则不能用前者，
 *   比如map.cicy.name会被解释为map的key为city的对象的属性name的值
 *   还可以结合<ct:call>标签来调用bean里的非getxxx()形式的方法。
 *   */
public class SpringCtxLoader extends WebApplicationObjectSupport {
	private static final Logger log = LoggerFactory
			.getLogger(SpringCtxLoader.class);
	/**
	 * Web application 中的常量集合Map的名字.
	 */
	private static final String SPRING_CONTEXT = "springctx";

	/**
	 * initialize application context .
	 */
	@SuppressWarnings("unchecked")
	protected void initApplicationContext() {
		try {
			final WebApplicationContext ctx = this.getWebApplicationContext();
			HashMap springServices = new HashMap() {
				/** 
                 *  
                 */
				private static final long serialVersionUID = -1759893921358235848L;

				public Object get(Object key) {
					return ctx.getBean((String) key);
				};

				public boolean containsKey(Object key) {
					return true;
				}
			};

			logger.info("load code table (spring  beans");
			// 放入到Web全局变量中，供页面使用.
			this.getServletContext().setAttribute(SPRING_CONTEXT,
					springServices);

		} catch (IllegalStateException e) {
			logger.warn("not web app application context ,can't be load "
					+ e.getLocalizedMessage());
		}
	}

}