package cn.com.topit.gl.action;
import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONObject;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.BookingService;
import cn.com.topit.gl.service.VRentContractService;
public class VRentContractAction<VRentContract> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VRentContractAction.class);
	private VRentContractService service;
	public void setService(VRentContractService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
