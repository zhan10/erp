package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.RechargeRecordService;
public class RechargeRecordAction<RechargeRecord> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(RechargeRecordAction.class);
	private RechargeRecordService service;
	public void setService(RechargeRecordService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
