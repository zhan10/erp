package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.ConsumeArea;
import cn.com.topit.gl.service.ConsumeAreaService;


public class ConsumeAreaAction extends GenericActionSupport<ConsumeArea> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ConsumeAreaAction.class);
	private ConsumeAreaService service;

	public void setService(ConsumeAreaService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	// 根据查询条件获取记录集
		public String getConsumeAreaComboBox() {
			try {
				records.put("records",  service
						.getConsumeAreaComboBox(baseSql + whereSql+order));
			} catch (Exception e) {
				log.error("getConsumeAreaComboBox出错："+e.toString());
				e.printStackTrace();
			}
			return "managerExt";
		}
}
