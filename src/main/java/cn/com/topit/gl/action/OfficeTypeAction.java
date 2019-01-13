package cn.com.topit.gl.action;

import cn.com.topit.base.GenericActionSupport;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import cn.com.topit.gl.service.OfficeTypeService;

public class OfficeTypeAction<OfficeType> extends GenericActionSupport {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory
			.getLogger(OfficeTypeAction.class);
	private OfficeTypeService service;

	public void setService(OfficeTypeService service) {
		this.service = service;
		super.setAbstractService(service);
	}

	// 根据查询条件获取记录集
	public String getOfficeTypesComboBox() {
		try {
			records.put("records",
					service.getOfficeTypesComboBox(baseSql + whereSql + order));
		} catch (Exception e) {
			log.error("getOfficeTypesComboBox出错：" + e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}
