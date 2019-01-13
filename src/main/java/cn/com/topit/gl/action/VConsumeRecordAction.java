package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.VConsumeRecordService;
public class VConsumeRecordAction<VConsumeRecord> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(VConsumeRecordAction.class);
	private VConsumeRecordService service;
	public void setService(VConsumeRecordService service) {
		this.service = service;
		super.setAbstractService(service);
	}
}
