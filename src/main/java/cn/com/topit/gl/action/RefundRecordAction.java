package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.RefundRecordService;
public class RefundRecordAction<RefundRecord> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(RefundRecordAction.class);
	private RefundRecordService service;
	public void setService(RefundRecordService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
