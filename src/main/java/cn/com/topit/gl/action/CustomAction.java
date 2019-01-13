package cn.com.topit.gl.action;
import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.service.CustomService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
public class CustomAction<Custom> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(CustomAction.class);
	private CustomService service;
	public void setService(CustomService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
		public String getCustomComboBox() {
			try {
				records.put("records",  service
						.getCustomComboBox(baseSql + whereSql+order));
			} catch (Exception e) {
				log.error("getUsersComboBox出错："+e.toString());
				e.printStackTrace();
			}			
			return "managerExt";
		}
}
