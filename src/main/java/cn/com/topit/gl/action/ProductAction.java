package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.ProductService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class ProductAction<Product> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ProductAction.class);
	private ProductService service;
	public void setService(ProductService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
