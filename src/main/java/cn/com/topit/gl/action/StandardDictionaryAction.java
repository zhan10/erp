package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.StandardDictionaryService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class StandardDictionaryAction<StandardDictionary> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(StandardDictionaryAction.class);
	private StandardDictionaryService service;
	public void setService(StandardDictionaryService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
