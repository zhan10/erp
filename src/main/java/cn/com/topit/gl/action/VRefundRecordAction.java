package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VRefundRecordService;
public class VRefundRecordAction<VRefundRecord> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VRefundRecordAction.class);
	private VRefundRecordService service;
	public void setService(VRefundRecordService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
