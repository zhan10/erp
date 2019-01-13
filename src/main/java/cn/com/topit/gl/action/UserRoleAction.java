package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.UserRoleService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class UserRoleAction<UserRole> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(UserRoleAction.class);
	private UserRoleService service;
	public void setService(UserRoleService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
