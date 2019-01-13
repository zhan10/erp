package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VRechargeRecordService;
public class VRechargeRecordAction<VRechargeRecord> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VRechargeRecordAction.class);
	private VRechargeRecordService service;
	public void setService(VRechargeRecordService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
