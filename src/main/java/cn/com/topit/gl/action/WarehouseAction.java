package cn.com.topit.gl.action;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import cn.com.topit.base.GenericActionSupport;
import cn.com.topit.gl.dao.Warehouse;
import cn.com.topit.gl.service.WarehouseService;


public class WarehouseAction extends GenericActionSupport<Warehouse> {
	private static final long serialVersionUID = 1L;
	private static final Logger log = LoggerFactory.getLogger(WarehouseAction.class);
	private WarehouseService service;

	public void setService(WarehouseService service) {
		this.service = service;
		super.setAbstractService(service);
	}
	// 根据查询条件获取记录集
	public String getWarehouseComboBox() {
		try {
			records.put("records",  service
					.getWarehouseComboBox(baseSql + whereSql+order));
		} catch (Exception e) {
			log.error("getWarehouseComboBox出错："+e.toString());
			e.printStackTrace();
		}
		return "managerExt";
	}
}
