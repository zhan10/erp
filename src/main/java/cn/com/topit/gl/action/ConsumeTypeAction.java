package cn.com.topit.gl.action;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.ConsumeType;
import cn.com.topit.gl.service.ConsumeTypeService;


public class ConsumeTypeAction extends GenericActionSupport<ConsumeType> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(ConsumeTypeAction.class);
	private ConsumeTypeService service;
	public void setService(ConsumeTypeService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
		public String getConsumeTypeComboBox() {
			try {
				records.put("records",  service
						.getConsumeTypeComboBox(baseSql + whereSql+order));
			} catch (Exception e) {
				log.error("getConsumeTypeComboBox出错："+e.toString());
				e.printStackTrace();
			}
			return "managerExt";
		}

}
