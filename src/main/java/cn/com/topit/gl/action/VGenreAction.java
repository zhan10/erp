package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.VGenreService;

public class VGenreAction<VGenre> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VGenreAction.class);
	private VGenreService service;
	public void setService(VGenreService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
